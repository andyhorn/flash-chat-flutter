import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final DateTime time;
  final bool isSelf;

  MessageBubble(
      {@required this.text,
      @required this.sender,
      @required this.isSelf,
      @required this.time});

  Alignment getContainerAlignment() {
    return isSelf ? Alignment.centerRight : Alignment.centerLeft;
  }

  CrossAxisAlignment getColumnAlignment() {
    return isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start;
  }

  Color getBackgroundColor() {
    return isSelf ? Colors.lightBlueAccent : Colors.white;
  }

  Color getTextColor() {
    return isSelf ? Colors.white : Colors.black87;
  }

  BorderRadius getBorderRadius() {
    return BorderRadius.only(
      bottomRight: kMessageBubbleRadius,
      bottomLeft: kMessageBubbleRadius,
      topLeft: isSelf ? kMessageBubbleRadius : Radius.zero,
      topRight: isSelf ? Radius.zero : kMessageBubbleRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      width: double.infinity,
      alignment: getContainerAlignment(),
      child: Column(
        crossAxisAlignment: getColumnAlignment(),
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 2.0,
            ),
            child: Text(sender),
          ),
          Material(
            color: getBackgroundColor(),
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey[500],
                style: BorderStyle.solid,
                width: 0.5,
              ),
              borderRadius: getBorderRadius(),
            ),
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20.0,
                  color: getTextColor(),
                  fontFamily: 'Calibri',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
