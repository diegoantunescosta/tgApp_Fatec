import 'package:flutter/material.dart';
import 'package:flutter_social/models/chat.dart';
import 'package:flutter_social/models/user.dart';

import '../../models/message.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    final List<User> users = [
      User(
        id: 1,
        name: 'Matt Maxwell',
        photo:
            'https://cdns-images.dzcdn.net/images/artist/2a418ab6e0c357bfd680d3f35b45d8ea/500x500.jpg',
      ),
      User(
        id: 2,
        name: 'Maria Perez',
        photo: 'https://www.vagalume.com.br/maria/images/maria.jpg',
      ),
      User(
        id: 3,
        name: 'Craig Jordan',
        photo:
            'https://conteudo.imguol.com.br/c/entretenimento/c1/2021/09/17/o-ator-daniel-craig-1631904101619_v2_450x337.jpg',
      ),
      User(
        id: 4,
        name: 'Charlotte Mckenzie',
        photo:
            'https://s2.glbimg.com/zDB-OXv1yf19uZ2GsmYVP1Xa9uc=/e.glbimg.com/og/ed/f/original/2021/05/01/charlotte.jpg',
      ),
      User(
        id: 5,
        name: 'Rita Pena',
        photo:
            'https://www.ofuxico.com.br/img/upload/noticias/2020/08/16/rita-netflix_383834_36.jpg',
      ),
      User(
        id: 6,
        name: 'Robin Mcguire',
        photo:
            'https://ogimg.infoglobo.com.br/cultura/25149265-11f-940/FT1086A/760/robin-batman.jpg',
      ),
      User(
        id: 7,
        name: 'Angelina Love',
        photo:
            'https://observatoriodocinema.uol.com.br/wp-content/uploads/2021/08/angelina-jolie.jpg',
      ),
      User(
        id: 8,
        name: 'Louis Diaz',
        photo:
            'https://conteudo.imguol.com.br/c/entretenimento/3c/2020/10/01/louis-tomlinson-1601601395427_v2_600x600.jpg',
      ),
      User(
        id: 9,
        name: 'Kyle Poole',
        photo: 'https://www.vagalume.com.br/kyle/images/kyle.jpg',
      ),
      User(
        id: 10,
        name: 'Brenda Watkins',
        photo:
            'https://upload.wikimedia.org/wikipedia/commons/c/c7/Brenda_Asnicar_2015.png',
      ),
    ];

    List<Message> messages = [
      Message(
          id: 1,
          date: DateTime.now(),
          user: users[0],
          read: true,
          body: "Ei! Como tá indo? 😀"),
      Message(
          id: 2,
          date: DateTime.now(),
          user: users[9],
          read: true,
          body: "Muito obrigado, estou na preparando a muda para amanhã 😍"),
      Message(
          id: 3,
          date: DateTime.now(),
          user: users[0],
          read: true,
          body: "Eu também. Você conseguiu falar com o pessoal do bosque?"),
      Message(
          id: 4,
          date: DateTime.now(),
          user: users[9],
          read: true,
          body: "Precisa confirmar se estará aberto"),
      Message(
          id: 5,
          date: DateTime.now(),
          user: users[0],
          read: true,
          body: "Ou moió o rolê "),
      Message(
          id: 6,
          date: DateTime.now(),
          user: users[9],
          read: true,
          body: "ok, vou dormir"),
    ];

    List<Chat> chats = [
      Chat(
          id: 1,
          user: users[0],
          messages: [messages[0], messages[1], messages[2], messages[3]]),
    ];

    final pageTitle = Padding(
      padding: EdgeInsets.only(top: 1.0, bottom: 20.0),
      child: Text(
        "Chats",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 40.0,
        ),
      ),
    );

    final searchBar = Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      height: 50.0,
      width: deviceWidth,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.only(top: 15.0),
          hintText: 'Procurar...',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );

    final onlineUsersHeading = Text(
      "Usuários Online",
      style: TextStyle(
        color: Colors.grey.withOpacity(0.6),
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      ),
    );

    final listOfOnlineUsers = Container(
      height: 100.0,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: chats
              .map((chat) => _buildUserCard(users[9], chat, context))
              .toList()),
    );

    final onlineUsers = Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          onlineUsersHeading,
          SizedBox(
            height: 10.0,
          ),
          listOfOnlineUsers
        ],
      ),
    );

    final chatList = Container(
      height: 500.0,
      child: ListView(
          children:
              chats.map((chat) => _buildChatTile(chat, context)).toList()),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          width: deviceWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    pageTitle,
                    searchBar,
                    onlineUsers,
                    chatList
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard(User user, Chat chat, BuildContext context) {
    print("Usuario");
    print(user.name);
    print(user.photo);
    final firstName = user.name.split(" ")[0];

    final onlineTag = Positioned(
      bottom: 10.0,
      right: 3.0,
      child: Container(
        height: 15.0,
        width: 15.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.0),
          color: Colors.lightGreen,
        ),
      ),
    );

    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/chat_details',
              arguments: {user: user, chat: chat}),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8.0),
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: AssetImage(user.photo),
                    image: NetworkImage(user.photo),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              onlineTag
            ],
          ),
        ),
        Text(
          firstName,
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _buildChatTile(Chat chat, BuildContext context) {
    // final unreadCount = Positioned(
    //   bottom: 9.0,
    //   right: 0.0,
    //   child: Container(
    //     height: 25.0,
    //     width: 25.0,
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       border: Border.all(color: Colors.white, width: 2.0),
    //       gradient: primaryGradient,
    //     ),
    //   ),
    // );

    final userImage = InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/user_details',
          arguments: {"user": chat.user},
        );
      },
      child: Stack(
        children: <Widget>[
          Hero(
            tag: "chat.userImage",
            child: Container(
              margin: EdgeInsets.only(right: 8.0, bottom: 10.0),
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //  image: AssetImage(chat.userImage),
                  image: NetworkImage(chat.user.photo),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          //     chat.unreadCount == 0 ? Container() : unreadCount
        ],
      ),
    );

    final userNameMessage = Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/chat_details',
            arguments: {chat: chat},
          );
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                chat.messages.last.body,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Colors.grey.withOpacity(0.6),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[userImage, userNameMessage],
      ),
    );
  }
}
