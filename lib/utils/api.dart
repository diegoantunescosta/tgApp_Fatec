import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  String url = 'http://localhost:3000/';

  Future<http.Response> login (String email, String password) async {
    Map<String,dynamic> bodyPost={'email':email,'senha': password};
    http.Response response = await http.post(Uri.parse (url + 'user/login'), body: bodyPost);
    return response;
  }
}