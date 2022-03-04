import 'package:flutter_social/views/home.dart';
import 'package:flutter_social/views/photo.dart';
import 'package:flutter_social/views/splash.dart';
import 'package:flutter_social/views/tabs/information_plant.dart';
import 'package:flutter_social/views/login.dart';
import 'package:flutter_social/views/landing.dart';
import 'package:flutter_social/views/register.dart';
import 'package:flutter_social/views/tabs/update_register.dart';
import 'package:flutter_social/views/user_details.dart';
import 'package:flutter_social/views/chat_details.dart';
import 'package:flutter_social/views/reset_password.dart';
import 'package:flutter_social/views/source_photo.dart';

final routes = {
  '/photo': (context) => Photo(),
  '/home': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/splash': (context) => SplashPage(),
  '/landing': (context) => LandingPage(),
  '/register': (context) => RegisterPage(),
  '/source_photo': (context) => SourcePage(),
  '/chat_details': (context) => ChatDetailsPage(),
  '/user_details': (context) => UserDetailsPage(),
  '/update_register': (context) => UpdateRegister(),
  '/reset_password': (context) => ResetPasswordPage(),
  '/information_plant': (context) => InformationPlant(),


};
