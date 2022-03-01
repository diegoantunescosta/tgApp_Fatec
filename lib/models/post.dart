import 'package:flutter_social/models/user.dart';

class Post {
  int id;
  String describe;
  String image;
  User user;
  DateTime date;

  Post({this.id, this.describe, this.image, this.user, this.date});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
        id: json['idPost'],
        describe: json['legenda'],
        image: json['imagePath'],
        date: json['date'],
        user: json['usuario']);
  }
}
