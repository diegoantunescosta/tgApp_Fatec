import 'package:flutter_social/models/user.dart';

class Message {
  int id;
  DateTime date;
  User user;
  String body;
  bool read;

  Message({this.body, this.user, this.read, this.date, this.id});

  factory Message.fromJson(Map<String, dynamic> json) {
    return new Message(
        id: json['idMessage'],
        body: json['message'],
        user: json['fromMe'],
        read: json['read']);
  }
}
