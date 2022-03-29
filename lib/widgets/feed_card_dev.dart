import 'package:flutter/material.dart';
import 'package:flutter_social/models/dev.dart';

class FeedCardDev extends StatelessWidget {
  final Dev dev;

  const FeedCardDev({Key key, this.dev}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userImage = Positioned(
      right: 0,
      top: 15.0,
      child: InkWell(
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(14.0),
          child: Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              image: DecorationImage(
                image: NetworkImage(dev.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //     ),
      ),
    );

    final userName = Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              dev.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          ]),
    );

    final descriptionText = Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              dev.describe,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          ]),
    );

    final socialMidia = Container(
      width: 200,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.facebook),
            color: Colors.blue,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.email),
            color: Colors.red,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.phone),
            color: Colors.green,
            onPressed: () {},
          )
        ],
      ),
    );

    final cardContent = Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          userName,
          descriptionText,
          socialMidia,
        ],
      ),
    );

    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Material(
              elevation: 20.0,
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                padding: EdgeInsets.only(top: 20.0, right: 50.0, left: 20.0),
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: cardContent,
              ),
            ),
          ),
          userImage,
        ],
      ),
    );
  }
}
