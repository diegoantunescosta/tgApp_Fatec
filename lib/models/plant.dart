import 'package:flutter/material.dart';

class Plant {
   final int id;
   final String name;
   final String image;
   final String describe;

   const Plant ({
     this.id,
     this.describe,
     @required this.name,
     @required this.image,

});


}