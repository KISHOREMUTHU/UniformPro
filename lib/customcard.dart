import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key key, this.snapshot, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var docId = snapshot.docs[index].id;

    TextEditingController nameController;
    TextEditingController dressController;
    TextEditingController shoulderController;
    TextEditingController chestController;
    TextEditingController handController;
    TextEditingController shirtlengthController;
    TextEditingController pantController;
    TextEditingController seatController;




     // super.initState();
      nameController     = TextEditingController(text : snapshot.docs[index]['name']);
      dressController    = TextEditingController(text : snapshot.docs[index]['dress']);
      shoulderController = TextEditingController(text : snapshot.docs[index]['shoulder']);
      chestController    = TextEditingController(text : snapshot.docs[index]['chest']);
      handController     = TextEditingController(text : snapshot.docs[index]['hand']);
      shirtlengthController = TextEditingController(text : snapshot.docs[index]['shirtlength']);
      pantController  =  TextEditingController(text : snapshot.docs[index]['pant']);
      seatController  =  TextEditingController(text : snapshot.docs[index]['seat']);




    var timeToDate = new DateTime.fromMillisecondsSinceEpoch(snapshot.docs[index]['timestamp'].seconds*1000);
    var dateFormatted = new DateFormat('EEEE , MMM d , y').format(timeToDate);

    return Column(
      children: 
      [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            elevation : 1.0,
            color: Colors.grey[400],

            child: Column(
              children: [
                ListTile(
                 title : Row(
                   children: [
                     Text(snapshot.docs[index]['name'],
                           style : TextStyle(
                             fontSize: 26,
                             fontFamily : 'Tinos',
                           ),),
                     SizedBox(height : 10),
                   ],
                 ),
                 subtitle : Text(snapshot.docs[index]['dress'],
                 style : TextStyle(
                   color : Colors.white,
                   fontSize : 18,
                   fontFamily : 'Tinos',

                 ),),
                 leading : CircleAvatar(
                    radius : 40,
                 // backgroundColor: Colors.yellowAccent,
                    backgroundImage: AssetImage('assets/karategi.jpg'),
                          ),


                ),
                Column(
                  mainAxisAlignment:  MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children : [
                   /* Text('Shirt : '),
                    SizedBox(height : 10.0),

                    Text("    Shoulder  Length : ${snapshot.docs[index]['shoulder']} "),
                    Text("    Hand  Length       : ${snapshot.docs[index]['hand']} "),
                    Text("    Chest  Length      : ${snapshot.docs[index]['chest']} "),
                    Text("    Shirt  Length        : ${snapshot.docs[index]['shirtlength']} "),
                    SizedBox(height : 20.0),
                    Text('Pant  : '),
                    SizedBox(height : 10.0),

                    Text("    Pant  Length     : ${snapshot.docs[index]['pant']} "),
                    Text("    Seat  Length     : ${snapshot.docs[index]['seat']} "),
  */
                  ],
                ),
                SizedBox(height : 15.0),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text (dateFormatted),
                    ],
                  ),
                ),
                 SizedBox(height : 10),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(width : 10),

                     IconButton (icon : Icon(FontAwesomeIcons.edit),iconSize : 25,color : Colors.white,
                                  onPressed: () async{
                             await showDialog(context: context,
                                           child : AlertDialog(
                                             contentPadding : EdgeInsets.all(10),
                                             content: Column(
                                               children : [
                                                 Text (
                                                     'Update Karateka details',
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
                                                     'Update Shirt Details',
                                                   style: TextStyle(
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
                                                         hintText: 'Chest Length : '
                                                     ),
                                                     controller : chestController,
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
                                                         hintText: 'Shirt Length : '
                                                     ),
                                                     controller : shirtlengthController,
                                                   ),
                                                 ),
                                                 SizedBox(height : 10),

                                                 Text (
                                                     'Update Pant details',
                                                   style: TextStyle(
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
                                                 //color : Colors.grey,
                                                 child : Text('Update'),
                                                 onPressed: (){
                                                   if(nameController.text.isNotEmpty && dressController.text.isNotEmpty && shoulderController.text.isNotEmpty && handController.text.isNotEmpty && chestController.text.isNotEmpty && shirtlengthController.text.isNotEmpty && pantController.text.isNotEmpty && seatController.text.isNotEmpty  ){
                                                      FirebaseFirestore.instance.collection('board').doc(docId).update(  {
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
                                                      //  print(response.id);
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

                                                 },
                                               ),

                                             ],
                                           ),
                             );
                                  },),
                     SizedBox(width : 10),
                     IconButton (icon : Icon(FontAwesomeIcons.trashAlt),iconSize : 25,color: Colors.white,
                     onPressed: () async {
                       await FirebaseFirestore.instance.collection('board').doc(docId).delete();
                     },),
                     SizedBox(width : 140),
                     MaterialButton(
                       color: Colors.white,
                       child: Text("See details", style : TextStyle(
                         color : Colors.grey,
                       ),),
                       onPressed: (){

                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ShowDetails(context , index)));

                       },                     ),

                   ],
                 ),
              ],
            ),
          ),
        ),
        //Text(snapshot.docs[index]['name']),
      ],
    );
  }
       Widget ShowDetails (BuildContext context , int index){
                 return Scaffold(
                   appBar : AppBar (
                     title : Text('Student Details'),
                     backgroundColor: Colors.redAccent,
                   ),
                   body : Container (
                     child : Column (
                       children: [

                         Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Container(
                             width: 400,
                             height : 140,
                             decoration : BoxDecoration(
                               borderRadius: BorderRadius.circular(10.0),
                               color : Colors.grey[400],

                             ),
                             child : Column (
                               children: [
                                 SizedBox(height : 20),

                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text('Student Name : ',
                                       style : TextStyle(
                                         fontFamily: 'Tinos',
                                         fontSize: 20,
                                         color : Colors.white,
                                         fontWeight: FontWeight.bold,
                                       ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(snapshot.docs[index]['name'],
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           //color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),

                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text('Dress Type     : ',
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(snapshot.docs[index]['dress'],
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           //color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),

                               ],
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Container(
                             width: 400,
                             height : 220,
                             decoration : BoxDecoration(
                               borderRadius: BorderRadius.circular(10.0),
                               color : Colors.grey[400],

                             ),

                             //color : Colors.blueGrey,
                             child : Column (
                               children: [
                                 SizedBox(height: 10,),

                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment : CrossAxisAlignment.center,
                                   children: [
                                     Text (" Shirt Details",
                                       style : TextStyle(
                                         fontFamily: 'Tinos',
                                         fontSize: 27,
                                       //  color : Colors.white,
                                         fontWeight: FontWeight.bold,
                                       ),

                                     )
                                   ],
                                 ),
                                 SizedBox(height: 15,),

                                 Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text('Shoulder Length : ',
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),

                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(snapshot.docs[index]['shoulder'],
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                          // color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text('Hand Length      : ',
                                         style : TextStyle(
                                         fontFamily: 'Tinos',
                                         fontSize: 20,
                                         color : Colors.white,
                                         fontWeight: FontWeight.bold,
                                       ),
                                       ),
                                     ),

                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(snapshot.docs[index]['hand'],
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                         //  color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text('Chest Length     : ',
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                             color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(snapshot.docs[index]['chest'],
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           //  color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text('Shirt Length      : ',
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                             color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(snapshot.docs[index]['shirtlength'],
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           //  color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),




                               ],
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Container(
                            // padding: const EdgeInsets.all(20.0),

                             width: 400,
                             height : 170,
                             decoration : BoxDecoration(
                               borderRadius: BorderRadius.circular(10.0),
                               color : Colors.grey[400],

                             ),

                             //    color : Colors.blueGrey,
                             child : Column (
                               children: [
                                 SizedBox(height: 10,),
                                 Text (" Pant Details",
                                   style : TextStyle(
                                     fontFamily: 'Tinos',
                                     fontSize: 27,
                                     //  color : Colors.white,
                                     fontWeight: FontWeight.bold,
                                   ),

                                 ),
                                 SizedBox(height: 15,),

                                 Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text('Pant Length : ',
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(snapshot.docs[index]['pant'],
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           //  color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text ('Seat Length : ',
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                             color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(snapshot.docs[index]['seat'],
                                         style : TextStyle(
                                           fontFamily: 'Tinos',
                                           fontSize: 20,
                                           //  color : Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),

                               ],
                             ),
                           ),
                         ),

                       ],
                     ),
                   ),
                 );
       }
}

