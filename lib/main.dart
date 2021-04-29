import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kineticsfactory/google_signin.dart';
import 'package:kineticsfactory/openingpage.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instanceFor();
final GoogleSignIn _googleSignin = new GoogleSignIn();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "Uniform Pro",
    debugShowCheckedModeBanner: false,
    home: StartingPage(),
  ));
}

class StartingPage extends StatefulWidget {
  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            if (provider.isSigningIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              return OpenPage();
            } else {
              return SignUpWidget();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          //CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );
}

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 15),

        Text(
          'Welcome To Uniform Pro !!!',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Sign In To Enter our App',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 22,
            // fontWeight : FontWeight.bold,
          ),
        ),
        SizedBox(height: 60),
        Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/web_hi_res_512.png'),
          ),
        ),

        SizedBox(height: 50),
        // FacebookSignInButtonWidget(),

        GoogleSignInButtonWidget(),
        SizedBox(height: 6),
      ],
    );
  }
}

class GoogleSignInButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 300,
      //color: Colors.redAccent,
      padding: EdgeInsets.all(4),
      child: OutlinedButton.icon(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login();
        },
        icon: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.white,
          size: 30,
        ),
        label: Text('     Sign In With Google ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}

class FacebookSignInButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: FaIcon(
          FontAwesomeIcons.facebookF,
          color: Colors.blue,
        ),
        label: Text('Sign In With Facebook',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
