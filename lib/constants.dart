import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const String kLogoHeroTag = 'logo_tag';

const EdgeInsets kRoundedButtonPadding = EdgeInsets.symmetric(vertical: 16.0);
final BorderRadius kRoundedButtonRadius = BorderRadius.circular(30.0);
const double kRoundedButtonElevation = 5.0;
const double kRoundedButtonMinWidth = 200.0;
const double kRoundedButtonHeight = 42.0;

const kInputFieldBorderRadius = BorderRadius.all(Radius.circular(32.0));
const kInputFieldBorderSide = BorderSide(
  color: Colors.blueAccent,
  width: 1.0,
);

final InputDecoration kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: kInputFieldBorderRadius,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: kInputFieldBorderRadius,
    borderSide: kInputFieldBorderSide,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: kInputFieldBorderRadius,
    borderSide: kInputFieldBorderSide.copyWith(
      width: 2.0,
    ),
  ),
);