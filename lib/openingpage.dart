import 'package:flutter/material.dart';
import 'package:kineticsfactory/kineticpage.dart';

class OpenPage extends StatefulWidget {
  @override
  _OpenPageState createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text('Arakawa Stanly Wado-Kai India',
        style : TextStyle(
          color : Colors.black,
          fontFamily: 'Tinos'
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 10,
      ),
         body : Container(
           decoration : BoxDecoration(
           image : DecorationImage(
             image : AssetImage('assets/stanlysensei.jpg'),
           ),),
         ),
        persistentFooterButtons: [
          MaterialButton(
            height: 60,
            minWidth: 300,
            color : Colors.red,
            onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => KineticsPage()));
            },
            child : Text('Go To Uniform Page',
            style : TextStyle(
              fontSize: 17,
              fontFamily: 'Tinos',
              color : Colors.white,
            ),),
          ),
        ],
    );
  }
}
