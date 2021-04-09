import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kineticsfactory/firebasecollection.dart';
import 'package:kineticsfactory/kineticpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kineticsfactory/openingpage.dart';

final FirebaseAuth _auth = FirebaseAuth.instanceFor();
final GoogleSignIn _googleSignin = new GoogleSignIn();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: OpenPage(),

  ));
}

class gSignin extends StatefulWidget {
  @override
  _gSigninState createState() => _gSigninState();
}

class _gSigninState extends State<gSignin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text('Google - Auth'),
      ),
      body : Center(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child : Text('Google Sign-In'),
                onPressed:() => signin(),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  child : Text('Sign In With Mail'),
                  onPressed:(){

                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  child : Text('Create Account'),
                  onPressed:(){

                  }
              ),
            ),
          ],
        ),
      ),
    );

  }
  Future<User> signin() async {
    GoogleSignInAccount googleUser = await _googleSignin.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final User user = (await _auth.signInWithCredential(credential)) as User ;

    print("signed in " + user.displayName);
    return user;
  }
}


