import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  final databaseReference = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Test App'),
      ),
      body : Container(
           child : RaisedButton(
             child : Text('Press'),
             onPressed : (){
               createDatabase();
             }
           ),
      ),
    );
  }
  void createDatabase() async {
    await databaseReference.collection('app');
  }
}
