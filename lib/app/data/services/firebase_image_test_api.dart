import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wizard/app/data/models/firebase_image.dart';
import 'package:wizard/app/data/provider/app_permisions.dart';

class FirebaseApi {
  static Future<List<FirebaseImage>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls =
        await _getDownloadLinks(result.items); //List<Reference> get items

    // <!-- pegando os Urls dos dados  -->
    var dados = urls
        .asMap()
        .map((index, url) {
          final _ref = result.items[index];
          final _name = _ref.name;
          // <!--Finalmente vou ter que criar um FileDoFirebase -->
          final file = FirebaseImage(ref: _ref, name: _name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();

    return dados;
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> references) {
    // 'metodo que retorn os links de download de files passado como referencia'
    return Future.wait(references.map((ref) => ref.getDownloadURL()).toList());
  }

  static Future download_cover_image(Reference ref) async {
    // com Reference ref tem os metodos de [apagar baixair e mais, portanto agora so vamos baixar para apasta /saidino/covers]
    // fara download para apasta especiica abaixo
    // final saidin_dir_app = await FirebaseApi.get_saidino_path('covers');
    final saidin_dir = await FirebaseApi.create_external('covers');
    final file = File('${saidin_dir.path}/${ref.name}');

    await ref.writeToFile(file).then((e) {
      Get.snackbar(
          'Baixado', 'Image Baixado com sucesso vai ate ${saidin_dir.path}',
          backgroundColor: Colors.greenAccent,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  static Future<Directory> get_saidino_path(String path) async {
    final dir = await getApplicationDocumentsDirectory();
    final saidin_path = Directory('${dir.path}/saidino/${path}');
    // if (saidin_path.existsSync()) return saidin_path;
    try {
      await Directory(saidin_path.path).create();
      return saidin_path;
    } on Exception catch (e) {
      Get.defaultDialog(
        title: 'Creating saidin_path',
        content: Text('$e'),
      );
    }
    return dir;
  }

  static Future<Directory> create_external(String section) async {
    final folder = 'saidino_apps';
    final path = Directory('storage/emulated/0/$folder');

    AppPermisions.storage_permision();

    if (await path.exists()) {
      // Get.snackbar('Folder Exists', 'ja tem esse directory');
      return path;
    }
    await path.create();
    return path;
  }
}
