import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wizard/app/data/models/firebase_image.dart';
import 'package:wizard/app/data/provider/file_manager.dart';
import 'package:wizard/app/data/services/firebase_image_test_api.dart';

class ImageDetails extends StatefulWidget {
  final FirebaseImage image;

  ImageDetails({Key? key, required this.image}) : super(key: key);

  @override
  _ImageDetailsState createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  final file_manager = FileManager();

  int _counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    file_manager.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
    super.initState();
  }

  Future<File> _increment() {
    setState(() {
      _counter++;
    });
    return file_manager.writeCouter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.image.name),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              icon: Icon(
                Icons.download,
              ),
              onPressed: () async {
                await FirebaseApi.download_cover_image(widget.image.ref);
              })
        ],
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.image.url),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Card(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('this counter num $_counter'),
          )))),
      floatingActionButton:
          FloatingActionButton(onPressed: _increment, child: Icon(Icons.add)),
    );
  }
}
