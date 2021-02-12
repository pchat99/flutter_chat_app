import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var auth = FirebaseAuth.instance;
  String email;
  String password;
  bool sspin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.teal[900],
      ),
      body: ModalProgressHUD(
        inAsyncCall: sspin,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Email",
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
                    hintText: "Enter Password",
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
                    minWidth: 200,
                    height: 40,
                    child: Text('Login'),
                    onPressed: () async {
                      setState(() {
                        sspin = true;
                      });

                      try {
                        var userSignin = await auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        print(userSignin);

                        if (userSignin != null) {
                          Navigator.pushNamed(context, "home");
                          setState(() {
                            sspin = false;
                          });
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
      ),
    );
  }
}
