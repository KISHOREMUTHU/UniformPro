import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kineticsfactory/customcard.dart';


class KineticsPage extends StatefulWidget {
  @override
  _KineticsPageState createState() => _KineticsPageState();
}

class _KineticsPageState extends State<KineticsPage> {
  TextEditingController nameController;
  TextEditingController dressController;
  TextEditingController shoulderController;
  TextEditingController chestController;
  TextEditingController handController;
  TextEditingController shirtlengthController;
  TextEditingController pantController;
  TextEditingController seatController;



  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dressController = TextEditingController();
    shoulderController = TextEditingController();
    chestController =  TextEditingController();
    handController =  TextEditingController();
    shirtlengthController = TextEditingController();
    pantController =  TextEditingController();
    seatController =  TextEditingController();


  }

  var firestoreDb = FirebaseFirestore.instance.collection('praveenmaster').snapshots(
      includeMetadataChanges: true,
                 );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text ( 'Uniform Pro'),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child : Icon(FontAwesomeIcons.penSquare,),
        onPressed: (){
          _showDialog(context);
        }
      ),
      body : StreamBuilder(
        stream :firestoreDb ,
        builder : (context , snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder : (context, int index ){
               // return Text(snapshot.data.docs[index]['shoulder']);
                return CustomCard(snapshot : snapshot.data, index : index);
              }
            );
          }
        },
      ),
    );
  }
  _showDialog(BuildContext context)async{
    await showDialog(context: context ,
      child : AlertDialog(
         contentPadding : EdgeInsets.all(5.0),
        content : Column(
          children: [
            Text (
              'Enter Karateka details',
              style: TextStyle(
                  fontFamily:  'Tinos'
              ),
            ),
            Expanded(
              child : TextField(
                autofocus: true,
                autocorrect: true,
                decoration : InputDecoration(
                  hintText: 'Student Name : '
                ),
                controller : nameController,
              ),
            ),
            Expanded(
              child : TextField(
                autofocus: true,
                autocorrect: true,
                decoration : InputDecoration(
                    hintText: 'Dress Type : '
                ),
                controller : dressController,
              ),
            ),
            SizedBox(height : 10),
            Text (
                'Shirt Details', style: TextStyle(
                fontFamily:  'Tinos'
            ),
            ),
            Expanded(
              child : TextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal : true,
                ),
                autofocus: true,
                autocorrect: true,
                decoration : InputDecoration(
                    hintText: 'Shirt Length : '
                ),
                controller : shirtlengthController,
              ),
            ),

            Expanded(
              child : TextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal : true,
                ),
                autofocus: true,
                autocorrect: true,
                decoration : InputDecoration(
                    hintText: 'Shoulder Length : '
                ),
                controller : shoulderController,
              ),
            ),
            Expanded(
              child : TextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal : true,
                ),
                autofocus: true,
                autocorrect: true,
                decoration : InputDecoration(
                    hintText: 'Hand Length : '
                ),
                controller : handController,
              ),
            ),

            Expanded(
              child : TextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal : true,
                ),
                autofocus: true,
                autocorrect: true,
                decoration : InputDecoration(
                    hintText: 'Chest Length : '
                ),
                controller : chestController,
              ),
            ),
            SizedBox(height : 10),

            Text (
                'Pant details', style: TextStyle(
                fontFamily:  'Tinos'
            ),

            ),

            Expanded(
              child : TextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal : true,
                ),
                autofocus: true,
                autocorrect: true,
                decoration : InputDecoration(
                    hintText: 'Pant Length : '
                ),
                controller : pantController,
              ),
            ),
            Expanded(

              child : TextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal : true,
                ),
                autofocus: true,
                autocorrect: true,
                decoration : InputDecoration(
                    hintText: 'Seat Length : '
                ),
                controller : seatController,
              ),
            ),


          ],
        ),
        actions: [
          FlatButton(
            child : Text('Cancel'),
            onPressed: (){
              nameController.clear();
              dressController.clear();
              shoulderController.clear();
              handController.clear();
              chestController.clear();
              shirtlengthController.clear();
              pantController.clear();
              seatController.clear();

              Navigator.pop(context);
            },
          ),
          FlatButton(
            child : Text('Save'),
            onPressed: (){
              if(nameController.text.isNotEmpty && dressController.text.isNotEmpty && shoulderController.text.isNotEmpty && handController.text.isNotEmpty && chestController.text.isNotEmpty && shirtlengthController.text.isNotEmpty && pantController.text.isNotEmpty && seatController.text.isNotEmpty  ){
                FirebaseFirestore.instance.collection('praveenmaster').add({
                  "name" : nameController.text,
                  "dress" : dressController.text,
                  "shoulder" : shoulderController.text,          
                  "hand" : handController.text,
                  "chest" : chestController.text,
                  "shirtlength" : shirtlengthController.text,
                  "pant" : pantController.text,
                  "seat" : seatController.text,
                  "timestamp" : new DateTime.now(),


                }).then((response){
                  print(response.id);
                  Navigator.pop(context);
                  nameController.clear();
                  dressController.clear();
                  shoulderController.clear();
                  handController.clear();
                  chestController.clear();
                  shirtlengthController.clear();
                  pantController.clear();
                  seatController.clear();
                }).catchError((error )=> print('Error'));
              }
              else {
                Navigator.pop(context);

              }
            },
          ),

        ],
    ), );
  }
}
