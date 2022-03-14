import 'package:flutter/material.dart';
import 'package:flutter_social/models/plant.dart';
import '../../widgets/feed_card_crud_plant.dart';


class PanelPlantUser extends StatefulWidget {
  @override
  _PanelPlantUserState createState() => _PanelPlantUserState();
}
class _PanelPlantUserState extends State<PanelPlantUser> {
  Widget build(BuildContext context) {
    final List<Plant> testes = [

      Plant(
          id: 1,
          name: 'Nome da planta',
          image:
          'https://cdn.pixabay.com/photo/2013/08/22/19/18/flowers-174817__340.jpg',
          describe: 'Subtitulo da planta'),
      Plant(
          id: 2,
          name: 'Nome da planta',
          image:
          'https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819__340.jpg',
          describe: 'Subtitulo da planta'),
      Plant(
          id: 3,
          name: 'Nome da planta',
          image:
          'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
          describe: 'Subtitulo da planta'),
      Plant(
          id: 4,
          name: 'Nome da planta',
          image:
          'https://cdn.pixabay.com/photo/2015/04/19/08/32/rose-729509__340.jpg',
          describe: 'Subtitulo da planta'),
      Plant(
          id: 5,
          name: 'Nome da planta',
          image:
          'https://cdn.pixabay.com/photo/2017/06/12/17/54/anemone-2396299__340.jpg',
          describe: 'Subtitulo da planta'),

    ];
    final pageTitle = Padding(
      padding: EdgeInsets.only(top: 1.0, bottom: 30.0),
      child: Text(
        "Painel de Postagens",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 40.0,
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.1),
          padding: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 30.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    pageTitle,

                    FeedCardCrudPlant(
                      plant: testes[0],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FeedCardCrudPlant(
                      plant: testes[1],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FeedCardCrudPlant(
                      plant: testes[2],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FeedCardCrudPlant(
                      plant: testes[3],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


