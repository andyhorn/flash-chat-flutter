import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isSelf;

  MessageBubble(
      {@required this.text, @required this.sender, @required this.isSelf});

  Alignment getContainerAlignment() {
    return isSelf ? Alignment.centerRight : Alignment.centerLeft;
  }

  CrossAxisAlignment getColumnAlignment() {
    return isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start;
  }

  Color getMessageColor() {
    return isSelf ? Colors.lightBlueAccent : Colors.lightGreenAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: getContainerAlignment(),
        child: Column(
          crossAxisAlignment: getColumnAlignment(),
          children: [
            Material(
              borderRadius: BorderRadius.circular(10.0),
              color: getMessageColor(),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 5.0,
              ),
              child: Text(sender),
            ),
          ],
        ));
    // return Container(
    //   width: double.infinity,
    //   alignment: Alignment.centerRight,
    //   child: Material(
    //     borderRadius: BorderRadius.circular(10.0),
    //     color: Colors.lightBlueAccent,
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: [
    //           Text(sender),
    //           Text(text),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
