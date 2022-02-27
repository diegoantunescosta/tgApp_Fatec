import 'package:flutter_social/stores/register.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social/app.dart';
import 'package:flutter_social/stores/home.dart';
import 'package:flutter_social/utils/colors.dart';

void main() {
  GetIt serviceLocator = GetIt.instance;

  serviceLocator.registerSingleton<Home>(Home());
  serviceLocator.registerSingleton<Register>(Register());

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryDark));

  runApp(App());
}
