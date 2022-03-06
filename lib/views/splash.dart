import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social/utils/api.dart';
import 'package:flutter_social/utils/utils.dart';
import 'package:flutter_social/stores/user.dart';
import 'package:flutter_social/utils/colors.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

final api = GetIt.I.get<API>();
final user = GetIt.I.get<User>();

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() async {
    await user.onAppInitTreatLogin();
    Future.delayed(Duration(seconds: 7)).then((value) {
      // Verificar conexões de rede, permissões de acesso, estado de login
      Navigator.popAndPushNamed(context, '/landing');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Change Status Bar Color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryColor),
    );

    final logo = Container(
      height: 500.0,
      width: 500.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AvailableImages.loading,
          fit: BoxFit.cover,
        ),
      ),
    );

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50.0),
              decoration: BoxDecoration(gradient: chatBubbleGradient2),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[logo],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
