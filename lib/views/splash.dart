import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/utils/api.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

final api = GetIt.I.get<API>();

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() async {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.popAndPushNamed(context, '/landing');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Center(
          child: Text(
            "Splash",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
