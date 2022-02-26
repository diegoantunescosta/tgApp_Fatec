import 'package:flutter/material.dart';
import 'package:flutter_social/models/feed.dart';

class FeedCard2 extends StatelessWidget {
  final Feed feed;

  const FeedCard2({Key key, this.feed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userImage = Positioned(
      right: 0,
      top: 15.0,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/user_details',
            arguments: feed.legenda),
        child: Hero(
          tag: feed.imagePath,
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(14.0),
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                image: DecorationImage(
                  image: AssetImage(feed.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final userName = Text(
      feed.nameUser,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );

    final descriptionText = Container(
      height: 80.0,
      child: Text(
        feed.legenda,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        ),
      ),
    );

    final cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        SizedBox(
          height: 5.0,
        ),
        descriptionText
      ],
    );

    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                padding: EdgeInsets.only(top: 20.0, right: 100.0, left: 20.0),
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
          userImage
        ],
      ),
    );
  }
}
