import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatApp"),
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Material(
                color: Colors.teal[800],
                borderRadius: BorderRadius.circular(30),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  child: Text('Registration'),
                  onPressed: () {
                    Navigator.pushNamed(context, "registration");
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                color: Colors.teal[800],
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 20,
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pushNamed(context, "login");
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
