import 'package:flutter/material.dart';
import 'package:flutter_social/utils/utils.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;




    final image = Image.asset(

      AvailableImages.emptyState['assetPath'],
      height: 150.0,
      width: 90.0,
    );

    final notificationHeader = Center(

      child: Text(
        "Não existe nova notificação",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0),
      ),
    );
    final notificationText = Text(
      "No momento, você não tem notificações.",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        color: Colors.grey.withOpacity(0.6),
      ),
      textAlign: TextAlign.center,
    );

    return Scaffold(
        appBar: AppBar(
        title: const Text('Notificações'),
        backgroundColor: Colors.orangeAccent,),
        body: new Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(
              height: deviceHeight * 0.1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[image, notificationHeader, notificationText],
            ),
          ],
        ),
      ),
    );
  }
}
