import 'package:flutter/material.dart';

class Dev {
  final int id;
  final String name;
  final String image;
  final String describe;

  const Dev({
    this.id,
    this.describe,
    @required this.name,
    @required this.image,
  });
}
