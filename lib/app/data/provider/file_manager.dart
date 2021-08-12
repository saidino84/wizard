import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'app_permisions.dart';

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

  static Future<Directory> getSaidingDirectory() async {
    // return saidino_dir;

    final saidin_path = 'saidino_apps';
    final root = Directory('storage/emulated/0/$saidin_path');

    AppPermisions.storage_permision();

    if (await root.exists()) {
      // Get.snackbar('Folder Exists', 'ja tem esse directory');
      return root;
    }
    await root.create();
    return root;
  }
}
