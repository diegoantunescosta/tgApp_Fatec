import 'package:flutter/material.dart';
import 'package:flutter_social/views/tabs/data_teste.dart';
import 'package:flutter_social/widgets/list_tile.dart';

class TesteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final teste = {...DATA_TEST};
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de Postagens'),
      ),
      body: ListView.builder(
        itemCount: teste.length,
        itemBuilder: (ctx, i) => TestTile(teste.values.elementAt(i)),
      ),
    );
  }
}
