import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_social/models/media_source.dart';
import 'package:flutter_social/views/source_photo.dart';
import 'package:flutter_social/widgets/video_widget.dart';



class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  File fileMedia;
  MediaSource source;


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('teste'),

    ),
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(32),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: fileMedia == null
                  ? Icon(Icons.photo, size: 120)
                  : (source == MediaSource.image
                  ? Image.file(fileMedia)
                  : VideoWidget(fileMedia)),
            ),
            const SizedBox(height: 50),

            ElevatedButton(
              child: Text('Imagem'),
              style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(90,60))),
              onPressed: () => capture(MediaSource.image),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: Text(' Video'),
              style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(90,60))),
              onPressed: () => capture(MediaSource.video),

            ),
          ],
        ),
      ),
    ),
  );

  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(
          arguments: source,
        ),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }
}