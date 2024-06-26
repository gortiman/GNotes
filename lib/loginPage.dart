import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:goole_notes/HomePage.dart';
import 'package:goole_notes/services/auth.dart';
import 'package:goole_notes/services/firestore_db.dart';
import 'package:goole_notes/services/login_info.dart';
// import 'package:keep_notes_clone_yt/home.dart';
// import 'package:keep_notes_clone_yt/services/auth.dart';
// import 'package:keep_notes_clone_yt/services/firestore_db.dart';
// import 'package:keep_notes_clone_yt/services/login_info.dart';
class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login To App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(Buttons.Google, onPressed:() async{
              await  signInWithGoogle();
              final User? currentUser = await _auth.currentUser;
              LocalDataSaver.saveLoginData(true);
              LocalDataSaver.saveImg(currentUser!.photoURL.toString());
              LocalDataSaver.saveMail(currentUser.email.toString());
              LocalDataSaver.saveName(currentUser.displayName.toString());
              await FireDB().getAllStoredNotes();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            })
          ],
        ),
      ),
    );

  }
}