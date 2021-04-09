import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.all(4),
      child : OutlineButton.icon(
        label : Text('Sign In With Google '),

      ),
    );
  }
}
