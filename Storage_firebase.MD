
# Metodos de Leitura No StorageFirebase E FAZER DOWNLOAD
'uma pasta com nome files '
[+] files/
[-] files contidos dentro do files/
    /files/image_1.png
    /files/image_2.png
    /files/image_3.png
    /files/image_4.png

```dart
<!-- MODELO -->
class FirebaseFile{
    final Reference ref;
    final String name;
    final String url;
    const FirebaseFile({required this.ref, required this.name, required this.url});
}


<!-- REPOSITORY -->
class FirebaseApi{
    static Future<List<FirebaseFile>> listAll(String path) async {
        final ref = FirebaseStorage.instance.ref(path);
        final result = await ref.listAll();

        final urls =await _getDownloadLinks(result.items); //List<Reference> get items

        <!-- pegando os Urls dos dados  -->
        var dados =urls.asMap().map((index,url){
            final _ref =result.items[index];
            final _name =_ref.name;
            <!--
             Finalmente vou ter que criar um FileDoFirebase
             -->
            final file = FirebaseFile(ref:_ref, name:_name,url:url);

            return MapEntry(index,file);
        }).values.toList();
    }

    static Future<List<Strings>> _getDownloadLinks(List<Reference> references){
        'metodo que retorn os links de download de files passado como referencia'
        return Future.wait(references.map((ref)=>ref.getDownloadURL()).toList());
    }
}

//View


 body: FutureBuilder<List<FirebaseImage>>(
            future: controller.futurefiles,
            builder: (ctx, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                        child:
                            Text('Some thik was wrong :\n ${snapshot.error}'));
                  } else {
                    final files = snapshot.data!;
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(
                              '/flutfirebase/covers =${files.length} arquivos '),
                          const SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: files.length,
                              itemBuilder: (ctx, index) {
                                var file = files[index];
                                return Card(
                                  child: ListTile(
                                    leading: Container(
                                      width: 70,
                                      height: 72,
                                      child: Image.network(
                                        file.url,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text('${file.name}'),
                                    subtitle: Text('${file.url}'),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]);
                  }
              }
            })

```

#CHECK APP COUTER SAVING IT INTO arquiv.txt and display that data into App

```dart

// controller
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/saidin.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      //Read the file
      final contentx = await file.readAsString();
      return int.parse(contentx);
    } catch (e) {
      return -1;
    }
  }

  Future<File> writeCouter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}

//int the  page

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



```
