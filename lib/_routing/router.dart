import 'package:flutter_social/views/home.dart';
import 'package:flutter_social/views/splash.dart';
import 'package:flutter_social/views/tabs/informationPlant.dart';
import 'package:flutter_social/views/login.dart';
import 'package:flutter_social/views/landing.dart';
import 'package:flutter_social/views/register.dart';
import 'package:flutter_social/views/user_details.dart';
import 'package:flutter_social/views/chat_details.dart';
import 'package:flutter_social/views/reset_password.dart';


final routes = {
  '/home': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/splash': (context) => SplashPage(),
  '/landing': (context) => LandingPage(),
  '/register': (context) => RegisterPage(),
  '/chat_details': (context) => ChatDetailsPage(),
  '/user_details': (context) => UserDetailsPage(),
  '/reset_password': (context) => ResetPasswordPage(),
  '/informationPlant': (context) => InformationPlant(),

};
