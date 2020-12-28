import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/routes.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatefulWidget {
  @override
  _FlashChatState createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  bool _initialized = false;
  bool _error = false;
  String _errorMessage;

  void initializeApp() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (err) {
      setState(() {
        _error = true;
        _errorMessage = err.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp(
        home: Center(
          child: Column(
            children: [Text('There has been an error:'), Text(_errorMessage)],
          ),
        ),
      );
    } else if (!_initialized) {
      return MaterialApp(
        home: Container(
          child: Center(
            child: Text('Loading...'),
          ),
        ),
      );
    } else {
      return MaterialApp(
        // initialRoute: kInitialRoute,
        home: WelcomeScreen(),
        routes: kRouteMap,
      );
    }
  }
}

// class FlashChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: kInitialRoute,
//       routes: kRouteMap,
//     );
//   }
// }
