import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Map<String, Object> data = {};
  Future<Map<String, String>> place;
  Position position;
  String featureName;
  String countryName;
  String postalCode;
  String state;
  String district;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    position = data['location'];
    featureName = data['featureName'];
    postalCode = data['postalCode'];
    district = data['district'];
    state = data['state'];
    countryName = data['countryName'];
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: deviceWidth,
                  height: deviceWidth,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                        'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 360, 0, 0),
                  child: Text(
                    'Chris',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      size: 30,
                    ),
                    title: Text(
                      featureName,
                    ),
                    subtitle: Text('$postalCode, $district, $state'),
                  ),
                  MaterialButton(
                    child: Text(
                      'Show on Map',
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'location',
                          arguments: {'location': position});
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
