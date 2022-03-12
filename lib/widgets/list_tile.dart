import 'package:flutter/material.dart';
import 'package:flutter_social/models/teste.dart';

class TestTile extends StatelessWidget {
  final Teste teste;

  TestTile(this.teste);

  @override
  Widget build(BuildContext context) {
    final avatar = teste.image == null || teste.image.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.image),
    )
        : CircleAvatar(backgroundImage: NetworkImage(teste.image));
    return ListTile(
      leading: avatar,
      title: Text(teste.name),
      trailing: Container (
          width: 100,
          child: Row (
          children: <Widget>[
            IconButton(
            icon: Icon(Icons.edit),
            color: Colors.blue,
            onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ]
      ),
      )
    );
  }
}
