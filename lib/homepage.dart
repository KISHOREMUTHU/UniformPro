import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:kineticsfactory/signinpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child : SignUp(),
      ),
    );
  }
}
