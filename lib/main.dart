import 'package:flutter/material.dart';
import 'package:flash_chat/routes.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: kInitialRoute,
      routes: kRouteMap,
    );
  }
}
