import 'package:flutter_social/views/devpage.dart';
import 'package:flutter_social/views/home.dart';
import 'package:flutter_social/views/photo.dart';
import 'package:flutter_social/views/login.dart';
import 'package:flutter_social/views/splash.dart';
import 'package:flutter_social/views/landing.dart';
import 'package:flutter_social/views/register_user.dart';
import 'package:flutter_social/views/tabs/feeds.dart';
import 'package:flutter_social/views/user_details.dart';
import 'package:flutter_social/views/chat_details.dart';
import 'package:flutter_social/views/source_photo.dart';
import 'package:flutter_social/views/reset_password.dart';
import 'package:flutter_social/views/tabs/update_register.dart';
import 'package:flutter_social/views/tabs/information_plant.dart';
import '../views/register_plant.dart';
import '../views/tabs/panel_plants_user.dart';
import '../views/tabs/profile.dart';

final routes = {
  '/photo': (context) => Photo(),
  '/home': (context) => HomePage(),
  '/feed': (context) => FeedsPage(),
  '/login': (context) => LoginPage(),
  '/devpage': (context) => DevPage(),
  '/splash': (context) => SplashPage(),
  '/profile': (context) => ProfilePage(),
  '/landing': (context) => LandingPage(),
  '/source_photo': (context) => SourcePage(),
  '/panel_plant': (context) => PanelPlantUser(),
  '/register_user': (context) => RegisterPage(),
  '/register_plant': (context) => RegisterPlant(),
  '/chat_details': (context) => ChatDetailsPage(),
  '/user_details': (context) => UserDetailsPage(),
  '/update_register': (context) => UpdateRegister(),
  '/reset_password': (context) => ResetPasswordPage(),
  '/information_plant': (context) => InformationPlant(),
};
