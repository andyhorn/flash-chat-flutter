import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  final String userEmail;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  MessageStream({@required this.userEmail});

  bool isSelf(String sender) => sender == userEmail;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        } else {
          final List<QueryDocumentSnapshot> messages = snapshot.data.docs;
          final List<MessageBubble> messageBubbles = [];

          for (final message in messages) {
            final String text = message.data()['text'];
            final String sender = message.data()['sender'];

            final MessageBubble messageBubble = MessageBubble(
              text: text,
              sender: sender,
              isSelf: isSelf(sender),
            );

            messageBubbles.add(messageBubble);
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: ListView(
                children: messageBubbles,
              ),
            ),
          );
        }
      },
    );
  }
}
