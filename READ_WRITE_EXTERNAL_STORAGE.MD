# dicas basica que apredi durante acraicao deste app cmo criar pasta em external_storage

# 1 handle_permissions of read and write
```yaml
permission_handler: ^8.1.4+2
```

# class e que gerencia as request das permissoes

```dart
import 'package:permission_handler/permission_handler.dart';

class AppPermisions {
  static storage_permision() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }
}
```
# ACLASSE CRIADORA DE PASTA UMA PASTA 
>> ![]()'se for para deixar a sua pasta dentro da instalacao do seu app  use o path_provider' caso nao use directament o ]
```dart 
final saidin_path = 'saidino_apps';
    final root = Directory('storage/emulated/0/$saidin_path');

```

```dart
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'app_permisions.dart';

class FileManager {
  Future<String> get _localPath async {
      //se for para deixar a sua pasta dentro da instalacao do seu app  use o path_provider
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

```

# CRIANDO A MINHA DATABASE DE JSON

```dart
class Db {
  static Future<File> get_db() async {
    var dir = await FileManager.getSaidingDirectory();
    var file = File('${dir.path}/databases/.database.json');
    AppPermisions.storage_permision();
    file.create(recursive: true).then((value) {
      // Get.snackbar('criation', 'db created successfully');
    });
    return file;
  }

  static Future read_data() async {
    var file = await get_db();
    String value = await file.readAsString();
    Get.snackbar('data', '$value');
  }

  static Future write_data(Map<String, String> data) async {
    var file = await get_db();
    String dados = await file.readAsString();
    // read_data();
    print(dados);
    Map<String, dynamic> json_ = json.decode(dados) as Map<String, dynamic>;
    Get.snackbar('tlido', json_.keys.first);

    // var strem = file.openRead();
    // Map<String, dynamic> json = jsonDecode(dados);
    json_['admins'].add(data);
    await file.writeAsString(json.encode(json_));
  }
}

```

# DELEGANDO TUDO AO MEU CONTROLER PARA AS VIEWS

```dart

class AppController {
  var name_ctl = TextEditingController();
  var password_ctl = TextEditingController();
  void save_data() {
    Db.write_data({'name': name_ctl.text, 'password': password_ctl.text})
        .then((value) {});
  }
}
}

```