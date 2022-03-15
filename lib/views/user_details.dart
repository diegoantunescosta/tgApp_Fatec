import 'package:flutter/material.dart';
import 'package:flutter_social/models/user.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:line_icons/line_icons.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;

  const UserDetailsPage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final User user = null;

    // final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final cancelBtn = Positioned(
      top: 50.0,
      left: 20.0,
      child: Container(


        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.5),
        ),
        child: IconButton(
          icon: Icon(LineIcons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
          iconSize: 20.0,
        ),
        ),

    );

    final userImage =
    Stack(
      children: <Widget>[
        Hero(
          tag: user.id,
          child: Container(
            height: 350.0,
            width: deviceWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: AssetImage(user.photo),
                image: NetworkImage(user.photo),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        cancelBtn
      ],
    );

    final userName = Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Row(
          children: <Widget>[
            Text(
              user.name,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              height: 30.0,
              width: 60.0,
              decoration: BoxDecoration(
                  gradient: chatBubbleGradient,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Icon(
                    //   user.gender == 'M' ? LineIcons.mars : LineIcons.venus,
                    //   color: Colors.white,
                    // ),
                    // Text(
                    //   user.age.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white,
                    //     fontSize: 18.0,
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ));

    // final userLocation = Container(
    //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
    //   child: Text(
    //     user.location,
    //     style: TextStyle(
    //       fontSize: 18.0,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.grey.withOpacity(0.8),
    //     ),
    //   ),
    // );

    final aboutUser = Padding(
      padding: EdgeInsets.all(20.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: deviceWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          constraints: BoxConstraints(minHeight: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Sobre Mim",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                "Meu nome é ${user.name} e adoro conhecer novas pessoas e fazer novos amigos. Eu amo a natureza,  esportes e um bom livro.",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );

    final plantas = Padding(
      padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: deviceWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          constraints: BoxConstraints(minHeight: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Plantações",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Wrap(
                children: null,
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            userImage,
            userName,
            // userLocation,
            aboutUser,
            plantas
          ],
        ),
      ),
    );
  }

  // Widget _buildHobbiesCards(String name) {
  //   return Container(
  //     padding: EdgeInsets.only(
  //       left: 10.0,
  //       right: 10.0,
  //     ),
  //     margin: EdgeInsets.only(right: 5.0, bottom: 3.0),
  //     height: 30.0,
  //     constraints: BoxConstraints(maxWidth: 80.0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12.0),
  //       color: Colors.transparent,
  //       border: Border.all(color: Colors.grey, width: 2.0),
  //     ),
  //     child: Center(
  //         child: Text(
  //       name,
  //       style: TextStyle(
  //         fontWeight: FontWeight.w600,
  //       ),
  //     )),
  //   );
  // }
}
