import 'package:flutter/material.dart';
import 'package:flutter_social/models/chat.dart';
import 'package:flutter_social/models/user.dart';
import 'package:flutter_social/utils/colors.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

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
      child: ListView(scrollDirection: Axis.horizontal, children: null),
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
      child: ListView(children: null),
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

  Widget _buildUserCard(User user, BuildContext context) {
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
          onTap: () =>
              Navigator.pushNamed(context, '/chat_details', arguments: user.id),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8.0),
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(user.photo),
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
    final unreadCount = Positioned(
      bottom: 9.0,
      right: 0.0,
      child: Container(
        height: 25.0,
        width: 25.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.0),
          gradient: primaryGradient,
        ),
      ),
    );

    final userImage = InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/user_details',
          arguments: chat.idUsuario,
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
                  image: NetworkImage(
                      "https://imagens.brasil.elpais.com/resizer/AXY-znKLjN2eo__LAuOLMJSSPFA=/1960x0/arc-anglerfish-eu-central-1-prod-prisa.s3.amazonaws.com/public/6TE7TL7D4YWZFV2TFRSGNGN6JE.jpg"),
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
            arguments: chat.idUsuario,
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
                chat.comentario,
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
