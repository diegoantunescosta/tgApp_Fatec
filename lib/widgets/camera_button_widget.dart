import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_social/models/media_source.dart';
import 'package:flutter_social/widgets/list_tile_widget.dart';

class CameraButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTileWidget(
        text: 'Camera',
        icon: Icons.camera_alt,
        onClicked: () => pickCameraMedia(context),
      );

  Future pickCameraMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().pickImage
        : ImagePicker().pickVideo;

    final media = await getMedia(source: ImageSource.camera);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }
}
