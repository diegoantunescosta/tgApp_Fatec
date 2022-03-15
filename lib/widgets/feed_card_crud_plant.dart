import 'package:flutter/material.dart';
import 'package:flutter_social/models/plant.dart';


class FeedCardCrudPlant extends StatelessWidget {
  final Plant plant;

  const FeedCardCrudPlant({Key key, this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userImage = Positioned(
      right: 0,
      top: 15.0,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/information_plant',
            arguments: plant.image),
        // child: Hero(
        //   tag: post.image,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(14.0),
          child: Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              image: DecorationImage(
                // image: AssetImage(feed.imagePath),
                image: NetworkImage(plant.image),
                // image: AvailableImages.appLogo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //     ),
      ),
    );

    final crud = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          color: Colors.blue,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {},
        ),
      ],
    );

    final userName = Text(
      plant.name,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );

    final descriptionText = Container(
      height: 20.0,
      child: Text(
        plant.describe,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        ),
      ),
    );

    final cardContent = Column(

      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 70.0),
        ),
        userName,
        descriptionText
      ],
    );


    return  Container(
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
              crud,
              userImage,
            ],
          ),
    );



  }
}
