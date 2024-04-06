import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goole_notes/services/login_info.dart';

import 'HomePage.dart';
import 'loginPage.dart';
// <meta name="google-signin-client_id" content="YOUR_GOOGLE_SIGN_IN_OAUTH_CLIENT_ID.apps.googleusercontent.com">

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDms9GbbS3P75V6hm7r6z8TOczu2S3W7kA',
      // authDomain: 'your_auth_domain',
      appId: '1:1060811722557:android:1f58e245cb2a71d0827f54',
      messagingSenderId: '1060811722557',
      projectId: 'notesflutter-fca62',
      // Add other configuration options
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogIn = false;

  getLoggedInState() async{

    await LocalDataSaver.getLogData().then((value){

      setState(() {
        isLogIn = value.toString() == "null";
      });
    });
  }

  @override
  void initState() {

    super.initState();
    getLoggedInState();

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLogIn ? Login(): HomePage(),
    );
  }
}


// Valid from: Fri Jun 09 15:05:24 IST 2023 until: Sun Jun 01 15:05:24 IST 2053
// Certificate fingerprints:
//          SHA1: 44:D8:63:78:54:10:88:6A:79:82:FD:74:E2:52:7A:6F:C1:50:11:B7
//          SHA256: 36:CA:24:D1:47:F5:EC:A8:26:80:80:AE:84:85:A8:E5:6F:C8:9F:0F:C9:F6:C9:C2:57:DA:E1:D7:03:D2:99:2E
// Signature algorithm name: SHA256withRSA
// Subject Public Key Algorithm: 2048-bit RSA key
// Version: 1