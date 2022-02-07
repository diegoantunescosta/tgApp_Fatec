import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_social/utils/utils.dart';

import 'dart:convert';



  class User {
  int id;
  String name;
  String photo;
  String location;
  String gender;
  int age;


  User({this.id, this.name, this.photo, this.gender, this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
        id: json['id'],
        name: json['nome'],
        photo: json['imagePath']
          );
      }
  }



