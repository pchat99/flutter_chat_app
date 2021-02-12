import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class ChatScreen4 extends StatefulWidget {
  @override
  _ChatScreen4State createState() => _ChatScreen4State();
}

Map<String, Position> geoposition;

class _ChatScreen4State extends State<ChatScreen4> {
  var fsconnect = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  var messageTextController = TextEditingController();

  String chatMessage;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var currentUserEmail = auth.currentUser.email;
    var currentUser;
    var addresses;
    var first;

    Future<Map<String, String>> _getPlaceMark(Position position) async {
      final CameraPosition _myLocation = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
      );
      final coordinates =
          new Coordinates(position.latitude, position.longitude);
      addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      first = addresses.first;
      return {
        'featureName': first.featureName,
        'countryName': first.countryName,
        'postalCode': first.postalCode,
        'state': first.adminArea,
        'district': first.subAdminArea
      };
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                Future<Map<String, String>> placeMark = _getPlaceMark(position);
                String featureName;
                String countryName;
                String postalCode;
                String state;
                String district;
                await placeMark.then((value) => {
                      featureName = value['featureName'],
                      countryName = value['countryName'],
                      postalCode = value['postalCode'],
                      state = value['state'],
                      district = value['district'],
                    });
                Navigator.pushNamed(context, 'profile4', arguments: {
                  'location': position,
                  'featureName': featureName,
                  'countryName': countryName,
                  'postalCode': postalCode,
                  'state': state,
                  'district': district,
                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                width: deviceWidth * 0.1,
                height: deviceWidth * 0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(deviceWidth * 0.50),
                  color: Colors.grey[300],
                ),
              ),
            ),
            Text('Simon'),
          ],
        ),
      ),
      body: FooterLayout(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Container(
                height: 25,
                width: 70,
                child: Center(
                  child: Text(
                    "TODAY",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        builder: (context, snapshot) {
                          var msg = snapshot.data.docs;

                          List<Widget> y = [];
                          for (var d in msg) {
                            var msgText = d.data()['text'];
                            var time = d.data()['time'];
                            var msgWidget = Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 4),
                                    child: FittedBox(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "$msgText",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                deviceWidth * 0.01,
                                                deviceWidth * 0.005,
                                                0,
                                                0),
                                            child: Text(
                                              "$time",
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            );
                            y.add(msgWidget);
                          }
                          print(y);

                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: y,
                            ),
                          );
                        },
                        stream: fsconnect.collection("chat").snapshots(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        footer: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.fromLTRB(deviceWidth * 0.01,
                    deviceWidth * 0.01, deviceWidth * 0.01, 5),
                width: deviceWidth * 0.84,
                child: TextField(
                  controller: messageTextController,
                  decoration: InputDecoration(
                    hintText: 'Type your message',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (value) {
                    chatMessage = value;
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(deviceWidth * 42.5),
                  color: Colors.grey[300],
                ),
              ),
              Container(
                width: deviceWidth * 0.14,
                child: FlatButton(
                  child: Icon(
                    Icons.send,
                    color: Colors.teal[900],
                    size: 40,
                  ),
                  onPressed: () async {
                    messageTextController.clear();
                    await fsconnect
                        .collection("user")
                        .doc(currentUserEmail)
                        .get()
                        .then(
                            (value) => currentUser = value["name"].toString());
                    var time =
                        "${DateTime.now().hour}:${DateTime.now().minute}";

                    await fsconnect.collection("chat").add({
                      "text": chatMessage,
                      "sender": currentUserEmail,
                      "name": currentUser,
                      "time": time,
                    });
                    print(currentUserEmail);
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
