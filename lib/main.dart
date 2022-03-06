import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social/app.dart';
import 'package:flutter_social/utils/api.dart';
import 'package:flutter_social/stores/home.dart';
import 'package:flutter_social/stores/user.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/stores/validate.dart';
import 'package:flutter_social/stores/localData.dart';

void main() {
  GetIt serviceLocator = GetIt.instance;

  serviceLocator.registerSingleton<API>(API());
  serviceLocator.registerSingleton<Home>(Home());
  serviceLocator.registerSingleton<User>(User());
  serviceLocator.registerSingleton<Validate>(Validate());
  serviceLocator.registerSingleton<LocalData>(LocalData());

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryDark));

  runApp(App());
}
