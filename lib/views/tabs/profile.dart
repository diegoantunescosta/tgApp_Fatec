import 'package:flutter/material.dart';
import 'package:flutter_social/models/user.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User _userData;

  @override
  Widget build(BuildContext context) {
    Future<User> _getUser() async {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getKeys().contains('user')) {
        _userData = User.fromJson(json.decode(prefs.getString('user')));
      }
      return _userData;
    }

    final hr = Divider();
    final userStats = Positioned(
      bottom: 10.0,
      left: 40.0,
      right: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildUserStats('VISITANTES', '2305'),
          _buildUserStats('CURTIDAS', '276'),
          _buildUserStats('SEGUIDORES', '51'),
        ],
      ),
    );

    final userImage = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: null,
        //   fit: BoxFit.cover,
        // ),
        shape: BoxShape.circle,
      ),
    );

    final userNameLocation = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _userData.name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'cidade',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    final userInfo = Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(8.0),
            shadowColor: Colors.white,
            child: Container(
              height: 220.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // userImage,
                    SizedBox(width: 10.0),
                    userNameLocation
                  ],
                ),
              ),
            ),
          ),
        ),
        userStats
      ],
    );

    final secondCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.white,
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              //   _buildIconTile(Icons.favorite, Colors.red, 'Likes'),
              //   hr,
              //   _buildIconTile(LineIcons.eye, Colors.green, 'Visitors'),
              //   hr,
              _buildIconTile(LineIcons.users, Colors.purpleAccent, 'Grupos'),
            ],
          ),
        ),
      ),
    );

    final thirdCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.white,
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              // _buildIconTile(LineIcons.money, Colors.red, 'My Wallet'),
              // hr,
              // _buildIconTile(LineIcons.diamond, Colors.blue, 'VIP Center'),
              // hr,
              // _buildIconTile(LineIcons.user_plus, Colors.orangeAccent, 'Find Friends'),
              // hr,
              // _buildIconTile(LineIcons.user_times, Colors.black, 'Blacklist'),
              // hr,
              _buildIconTile(LineIcons.cogs, Colors.grey.withOpacity(0.6),
                  'Configurações'),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                    future: _getUser(),
                    initialData: null,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Center();
                        default:
                          if (snapshot.hasError)
                            return Container();
                          else {
                            if (snapshot.hasData)
                              return Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 350.0,
                                      ),
                                      Container(
                                        height: 250.0,
                                        decoration: BoxDecoration(
                                            gradient: primaryGradient),
                                      ),
                                      Positioned(
                                          top: 100,
                                          right: 0,
                                          left: 0,
                                          child: userInfo)
                                    ],
                                  ),
                                  secondCard,
                                  thirdCard
                                ],
                              );
                            else
                              return Container();
                          }
                      }
                    })),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStats(String name, String value) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildIconTile(IconData icon, Color color, String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      trailing: Icon(LineIcons.chevron_circle_right),
    );
  }
}
