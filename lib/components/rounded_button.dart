import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.color, this.label, @required this.onPressed});
  final Color color;
  final Function onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kRoundedButtonPadding,
      child: Material(
        elevation: kRoundedButtonElevation,
        color: color,
        borderRadius: kRoundedButtonRadius,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: kRoundedButtonMinWidth,
          height: kRoundedButtonHeight,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
