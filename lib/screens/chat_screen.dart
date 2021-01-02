import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_stream.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String route = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _textController = TextEditingController();
  User _loggedInUser;
  String _text;

  void getCurrentUser() {
    final user = _auth.currentUser;

    if (user != null) {
      _loggedInUser = user;
    }
  }

  @override
  void initState() {
    super.initState();

    getCurrentUser();
    print(_loggedInUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(
              userEmail: _auth.currentUser.email,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onChanged: (value) {
                        //Do something with the user input.
                        _text = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      final Map<String, dynamic> data = {
                        'text': _text,
                        'sender': _auth.currentUser.email,
                        'time': DateTime.now().millisecondsSinceEpoch,
                      };

                      _firestore.collection('messages').add(data);
                      _textController.text = '';
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
