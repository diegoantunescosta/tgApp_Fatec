import 'package:flutter/material.dart';
import 'package:flutter_social/models/post.dart';
import 'package:flutter_social/models/user.dart';
import 'package:flutter_social/widgets/feed_card1.dart';
import 'package:flutter_social/widgets/feed_card2.dart';
import 'package:flutter_social/utils/api.dart';
import 'package:get_it/get_it.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

final api = GetIt.I.get<API>();

class _FeedsPageState extends State<FeedsPage> {
  Widget build(BuildContext context) {
    final List<User> users = [
      User(
          id: 1,
          name: 'Matt Maxwell',
          photo:
              'https://cdns-images.dzcdn.net/images/artist/2a418ab6e0c357bfd680d3f35b45d8ea/500x500.jpg',
          age: 27),
      User(
          id: 2,
          name: 'Maria Perez',
          photo: 'https://www.vagalume.com.br/maria/images/maria.jpg',
          age: 24),
      User(
          id: 3,
          name: 'Craig Jordan',
          photo:
              'https://conteudo.imguol.com.br/c/entretenimento/c1/2021/09/17/o-ator-daniel-craig-1631904101619_v2_450x337.jpg',
          age: 28),
      User(
          id: 4,
          name: 'Charlotte Mckenzie',
          photo:
              'https://s2.glbimg.com/zDB-OXv1yf19uZ2GsmYVP1Xa9uc=/e.glbimg.com/og/ed/f/original/2021/05/01/charlotte.jpg',
          age: 23),
      User(
          id: 5,
          name: 'Rita Pena',
          photo:
              'https://www.ofuxico.com.br/img/upload/noticias/2020/08/16/rita-netflix_383834_36.jpg',
          age: 25),
      User(
          id: 6,
          name: 'Robin Mcguire',
          photo:
              'https://ogimg.infoglobo.com.br/cultura/25149265-11f-940/FT1086A/760/robin-batman.jpg',
          age: 29),
      User(
          id: 7,
          name: 'Angelina Love',
          photo:
              'https://observatoriodocinema.uol.com.br/wp-content/uploads/2021/08/angelina-jolie.jpg',
          age: 22),
      User(
          id: 8,
          name: 'Louis Diaz',
          photo:
              'https://conteudo.imguol.com.br/c/entretenimento/3c/2020/10/01/louis-tomlinson-1601601395427_v2_600x600.jpg',
          age: 23),
      User(
          id: 9,
          name: 'Kyle Poole',
          photo: 'https://www.vagalume.com.br/kyle/images/kyle.jpg',
          age: 25),
      User(
          id: 10,
          name: 'Brenda Watkins',
          photo:
              'https://upload.wikimedia.org/wikipedia/commons/c/c7/Brenda_Asnicar_2015.png',
          age: 26),
    ];

    final List<Post> posts = [
      Post(
          id: 1,
          describe: 'Olha minha plantinha',
          image:
              'https://www.significados.com.br/foto/orquidea-significados-brasil.jpg',
          user: users[0]),
      Post(
          id: 2,
          describe: 'Rosa!',
          image:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Rosa_rosa-claro.jpg/220px-Rosa_rosa-claro.jpg',
          user: users[1]),
      Post(
          id: 3,
          describe: 'Olhaaaaaaa',
          image:
              'https://tetecastanha.vteximg.com.br/arquivos/ids/156088-1000-1000/Arranjo-em-vaso-de-ceramica-terracota-com-orquideas-phalaenopsis-cascata-pink--1-.jpg',
          user: users[2]),
      Post(
          id: 4,
          describe: 'Bonito',
          image:
              'https://images.tcdn.com.br/img/img_prod/936509/orquidea_mini_urucum_223_1_15f9af5fee56d3c5b37c94cb2708de0c.jpeg',
          user: users[3]),
    ];

    final pageTitle = Padding(
      padding: EdgeInsets.only(top: 1.0, bottom: 30.0),
      child: Text(
        "Inicio",
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
                    FeedCard2(
                      post: posts[0],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FeedCard1(
                      post: posts[1],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FeedCard2(
                      post: posts[2],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FeedCard1(
                      post: posts[3],
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
