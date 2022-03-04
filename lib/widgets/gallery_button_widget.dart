import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_social/models/media_source.dart';

import 'list_tile_widget.dart';

class GalleryButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTileWidget(
        text: 'Galeria',
        icon: Icons.photo,
        onClicked: () => pickGalleryMedia(context),
      );

  Future pickGalleryMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.gallery);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }
}
