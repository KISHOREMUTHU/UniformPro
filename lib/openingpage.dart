import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kineticsfactory/google_signin.dart';
import 'package:kineticsfactory/kineticpage.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Arakawa Stanly Wado-Kai India',
          style: TextStyle(color: Colors.black, fontFamily: 'Tinos'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      drawer: new Drawer(
        // var user = FirebaseAuth.instance.currentUser;

        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(user.photoURL),
                ),
                SizedBox(height: 8),
                Text(
                  user.displayName,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SizedBox.fromSize(
                              size: Size(100, 1000),
                              child: WebView(
                                initialUrl:
                                    "https://kishoremuthuselvan7.blogspot.com/?m=1",
                                javascriptMode: JavascriptMode.unrestricted,
                              ),
                            )));
              },
              child: ListTile(
                title: Text('Developer Info'),
                leading: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(
                  Icons.logout,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stanlysensei.jpg'),
          ),
        ),
      ),
      persistentFooterButtons: [
        MaterialButton(
          height: 60,
          minWidth: 300,
          color: Colors.red,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => KineticsPage()));
          },
          child: Text(
            'Go To Uniform Page',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Tinos',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
