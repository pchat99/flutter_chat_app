
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var fsconnect = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  String name;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: Colors.teal[900],
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                color: Colors.teal[800],
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  color: Colors.teal[800],
                  minWidth: 400,
                  height: 40,
                  child: Text('Sumbit'),
                  onPressed: () async {
                    try {
                      var user = await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      await fsconnect.collection("user").doc(email).set({
                        "name": name,
                        "email": email,
                      });
                      print(email);
                      print(password);
                      print(user);
                      if (user.additionalUserInfo.isNewUser == true) {
                        Navigator.pushNamed(context, "chat");
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
