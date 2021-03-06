import 'package:flutter/material.dart';
import 'package:flutter_social/theme.dart';
import 'package:flutter_social/_routing/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Me dá uma Plantinha',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      routes: routes,
      initialRoute: '/splash',
    );
  }
}
