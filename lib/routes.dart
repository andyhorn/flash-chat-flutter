import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';

const String kInitialRoute = WelcomeScreen.route;

final kRouteMap = {
  ChatScreen.route: (context) => ChatScreen(),
  LoginScreen.route: (context) => LoginScreen(),
  RegistrationScreen.route: (context) => RegistrationScreen(),
  WelcomeScreen.route: (context) => WelcomeScreen()
};
