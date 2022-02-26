import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_social/utils/utils.dart';

import 'dart:convert';

class Chat {
  int  idUsuario;
  int idPost;
  int idMessage;
  String comentario;

  Chat({this.idUsuario, this.idPost, this.idMessage, this.comentario});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return new Chat(
        comentario: json['comentario'],
        idUsuario: json['idUsuario'],
        idPost: json['idPost'],
        idMessage: json ['idMessage']
    );
  }

}
