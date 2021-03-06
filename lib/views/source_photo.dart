import 'package:flutter/material.dart';
import 'package:flutter_social/widgets/camera_button_widget.dart';
import 'package:flutter_social/widgets/gallery_button_widget.dart';

class SourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione Midia'),
          backgroundColor: Colors.orangeAccent),
      body: ListView(
        children: [
          CameraButtonWidget(),
          GalleryButtonWidget(),
        ],
      ),
    );
  }
}