import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kineticsfactory/kineticpage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: KineticsPage(),

  ));
}
