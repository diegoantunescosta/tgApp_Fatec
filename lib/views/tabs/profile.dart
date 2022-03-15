import 'package:flutter/material.dart';
import 'package:flutter_social/models/user.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/colors.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final User user = User(id: 1, name: 'Nome do Cliente', photo: 'https://cdn.pixabay.com/photo/2017/06/12/17/54/anemone-2396299__340.jpg');

    final userNameLocation = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            user.name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'São Paulo, SP',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    final userImage = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://cdn.pixabay.com/photo/2016/03/23/08/34/woman-1274361__340.jpg')
              ,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );

    final userInfo = Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          child: Material(
            elevation: 30.0,
            borderRadius: BorderRadius.circular(8.0),
            shadowColor: Colors.white,
            child: Container(
              height: 150.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[

                    userImage,
                    SizedBox(width: 10.0),
                    userNameLocation
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );

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

    final secondCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
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
              _buildIconTile(LineIcons.cogs, Colors.grey.withOpacity(0.6),
                  'Configurações'),
            ],
          ),

        ),

      ),
    );

   return Scaffold(
     appBar: AppBar(
         title: const Text('Perfil'),
        backgroundColor: Colors.orangeAccent),
     body: Center(
              child: Column(
          children: <Widget>[
                 Stack(
                  children: <Widget>[
                    Container(
                      height: 230.0,
                    ),
                    Container(
                    height: 150.0,
                    decoration: BoxDecoration(gradient: primaryGradient),
                    ),
                    Positioned(top: 50, right: 0, left: 0,
                        child: userInfo)
                  ],
              ),
                    secondCard,
                    thirdCard,
                  ],
              ),
            ),

            floatingActionButton: FloatingActionButton(
              tooltip: 'Adicionar',
              child: Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(context, '/panel_plant',

      ),
    ),
   );
  }
}


















