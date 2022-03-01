
import 'package:flutter/material.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_social/utils/utils.dart';


class InformationPlant extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final hr = Divider();



    final userImage = Container(
      height: 300.0,
      width: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
         // Imagem da plata Aqui
          image: AvailableImages.appLogo,
        ),
      ),
    );


    final info = Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(8.0),
            shadowColor: Colors.white,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: <Widget>[
                    userImage,
                    SizedBox(width: 30.0),

                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );

    final secondCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 0.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.white,
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              _buildIconTile(Icons.photo, Colors.red, 'Informações da Planta'),
              hr,
              _buildIconTile(LineIcons.map, Colors.green, 'Geolocalização'),
              hr,
              _buildIconTile(LineIcons.user, Colors.blue, 'Responsável'),


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
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 350.0,
                      ),
                      Container(
                        height: 250.0,
                        decoration: BoxDecoration(gradient: primaryGradient),
                      ),
                      Positioned(top: 100, right: 0, left: 0, child: info)
                    ],
                  ),
                  secondCard,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildIconTile(IconData icon, Color color, String title) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
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
