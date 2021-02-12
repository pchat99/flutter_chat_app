import 'package:flutter/material.dart';
import 'package:chatapp/auth/authentication.dart';
import 'package:chatapp/auth/login.dart';
import 'package:chatapp/auth/registration.dart';
import 'package:chatapp/tabs/home.dart';
import 'package:chatapp/tabs/chatscreen.dart';
import 'package:chatapp/tabs/chatscreen2.dart';
import 'package:chatapp/tabs/chatscreen3.dart';
import 'package:chatapp/tabs/chatscreen4.dart';
import 'package:chatapp/tabs/profile.dart';
import 'package:chatapp/tabs/profile2.dart';
import 'package:chatapp/tabs/profile3.dart';
import 'package:chatapp/tabs/profile4.dart';
import 'package:chatapp/tabs/location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterStatusbarcolor.setStatusBarColor(Colors.teal[900]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "authentication",
      routes: {
        "authentication": (context) => Authentication(),
        "home": (context) => Home(),
        "registration": (context) => Registration(),
        "login": (context) => Login(),
        "chatapp": (context) => ChatScreen(),
        "chatscreen2": (context) => ChatScreen2(),
        "chatscreen3": (context) => ChatScreen3(),
        "chatscreen4": (context) => ChatScreen4(),
        "profile": (context) => Profile(),
        "profile2": (context) => Profile2(),
        "profile3": (context) => Profile3(),
        "profile4": (context) => Profile4(),
        "location": (context) => Location(),
      },
    ),
  );
}
