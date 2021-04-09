import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kineticsfactory/signupwidget.dart';
import 'package:provider/provider.dart';


class GoogleSignInProvider extends ChangeNotifier {

}


class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => buildSignUp();
  Widget buildSignUp ()=> Column(
      children : [
        Spacer (),
        Align (
          alignment:  Alignment.center,
            child : Container(
              margin : EdgeInsets.symmetric(horizontal : 20),
              width : 175,
              child : Text (
                'Welcome User !!!',
                style : TextStyle (
                  fontSize : 30,
                  color : Colors .black,
                  fontFamily: 'Tinos'
                ),
              ),
            ),
        ),
        Spacer(),
        SizedBox(height : 15),
        GoogleSignInButton(),
        Text('Login To Continue' ,
        style : TextStyle (
          fontSize : 16,
        ),),
        Spacer(),
      ],

  );
}
