import 'package:flutter/material.dart';
import 'package:flutter_social/models/chat.dart';
import 'package:flutter_social/models/user.dart';
import 'package:flutter_social/widgets/chat_bubble.dart';

class ChatDetailsPage extends StatefulWidget {
  final User user;
  final Chat chat;
  const ChatDetailsPage({this.user, this.chat});

  @override
  State<ChatDetailsPage> createState() =>
      _ChatDetailsPageState(user: this.user, chat: this.chat);
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  final User user;
  final Chat chat;

  _ChatDetailsPageState({this.user, this.chat});

  @override
  Widget build(BuildContext context) {
    // final User user = null;

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    print(this.user);

    final userImage = InkWell(
      onTap: () => Navigator.pushNamed(context, '/user_details',
          arguments: {user: this.user}),
      child: Hero(
        tag: "user.id",
        child: Container(
          margin: EdgeInsets.only(right: 8.0, bottom: 10.0),
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage(user.photo),
              image: NetworkImage(user.photo),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );

    final userName = Hero(
      tag: user.name,
      child: Text(
        user.name,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final appBar = Material(
      elevation: 5.0,
      shadowColor: Colors.grey,
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
            ),
            userName,
            userImage
          ],
        ),
      ),
    );

    final textInput = Container(
      padding: EdgeInsets.only(left: 10.0),
      height: 47.0,
      width: deviceWidth * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Digite uma mensagem',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );

    final messageList = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: chat.messages.length,
      itemBuilder: (BuildContext context, int index) {
        return ChatBubble(message: chat.messages[index]);
      },
    );

    final inputBox = Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 60.0,
        width: deviceHeight,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: Colors.grey,
              ),
              iconSize: 32.0,
            ),
            textInput,
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Colors.grey,
              ),
              iconSize: 32.0,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceHeight,
            width: deviceWidth,
            child: Column(
              children: <Widget>[
                appBar,
                SizedBox(
                  height: 10.0,
                ),
                Flexible(
                  child: messageList,
                ),
              ],
            ),
          ),
          inputBox
        ],
      ),
    );
  }
}
