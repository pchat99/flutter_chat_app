import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        backgroundColor: Colors.teal[400],
        onPressed: () => {print('Somebody Clicked')},
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'ChatApp',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'CHATS',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'STATUS',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          'CALLS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.teal[800],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/Self%20Picture%201.jpeg',
                          ),
                          radius: 25,
                        ),
                        title: Text(
                          'Pranav Chaturvedi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          ' ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                '10:00 AM',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: Center(
                                child: Icon(
                                  AntDesign.pushpin,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'chatapp');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                          radius: 28,
                        ),
                        title: Text(
                          'Richard',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Hey mate!',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                '09:30 AM',
                                style: TextStyle(
                                  color: Colors.teal[400],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                              decoration: BoxDecoration(
                                color: Colors.teal[400],
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'chatscreen2');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                          radius: 28,
                        ),
                        title: Text(
                          'Chris',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Perfect',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '08:45 AM',
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'chatscreen3');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                          radius: 28,
                        ),
                        title: Text(
                          'Simon',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'See you soon!',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '08:00 AM',
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'chatscreen4');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                          radius: 28,
                        ),
                        title: Text(
                          'Andrea',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Alright! Send it real quick',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '07:59 AM',
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          print('Pressed the chat');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                          radius: 28,
                        ),
                        title: Text(
                          'Mom',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Good Morning Son! Have a nice day',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '07:30 AM',
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          print('Pressed the chat');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                          radius: 28,
                        ),
                        title: Text(
                          'Mathew',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Good Morning!',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '07:00 AM',
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          print('Pressed the chat');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                          radius: 28,
                        ),
                        title: Text(
                          'Dad',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          '\u2713 Good Night dad.',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'YESTERDAY',
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          print('Pressed the chat');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://raw.githubusercontent.com/pchat99/flutter_chat_app/main/unnamed.png'),
                          radius: 28,
                        ),
                        title: Text(
                          'Peter -  Photographer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Done! Photos are edited. I have mailed you all the photos',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'YESTERDAY',
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          print('Pressed the chat');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 85),
                        height: 2,
                        width: 200,
                        color: Colors.grey[300],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
