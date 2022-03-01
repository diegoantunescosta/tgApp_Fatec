import 'package:flutter_social/models/message.dart';
import 'package:flutter_social/models/user.dart';

class Chat {
  int id;
  User user;
  int idMessage;
  List<Message> messages;

  Chat({this.user, this.id, this.idMessage, this.messages});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return new Chat(
        messages: json['comentario'],
        user: json['idUsuario'],
        id: json['idPost'],
        idMessage: json['idMessage']);
  }
}
