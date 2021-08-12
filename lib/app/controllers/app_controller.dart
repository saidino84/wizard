import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:wizard/app/data/provider/app_permisions.dart';
import 'package:wizard/app/data/provider/file_manager.dart';
import 'package:wizard/app/ui/pages/admin_page/admin_page.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class AppController extends GetxController {
  final appdata = GetStorage(); //
  @override
  void onInit() {
    // TODO: implement onInit
    appdata.write('darkmode', false);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            Get.isDarkMode ? Colors.redAccent : Colors.greenAccent));
    super.onInit();
  }

  final _loged = false.obs;
  final is_loged = false.obs;
  final current_song_list = fake_mostPopular.obs;
  final current_song_color = Color(0xffc2c2c2).obs;
  var _is_dark = false.obs;
  bool get is_dark => _is_dark.value;
  bool? get is_dark_mode => appdata.read<bool>('darkmode');
  bool get user_is_loged => _loged.value;
  final curent_index = 0.obs;

  Rx<AssetSong> get current_song =>
      current_song_list.value[curent_index.value].obs;
  // Rx<AssetSong> set current_song(index) => fake_mostPopular[index];
  final current_slider = 0.0.obs;

  void next_song() {
    print('[ start]$curent_index');
    var len_songs = current_song_list.value.length - 1;
    if (curent_index.value < len_songs) {
      curent_index.value++;
      // update_palete_colors();
      return;
    }
    if (curent_index.value >= len_songs) curent_index.value = 0;
    // update_palete_colors();
  }

  Future update_palete_colors() {
    return PaletteGenerator.fromImageProvider(
      AssetImage(current_song.value.image),
      size: Size(400, 300),
    ).then((color_generator) {
      final cor =
          color_generator.lightMutedColor ?? PaletteColor(Colors.blue, 2);
      // current_song_color.value = cor.color;
    });
  }

  final name_ctl = TextEditingController();
  final password_ctl = TextEditingController();
  void admin_login() {
    final String name = name_ctl.text;
    final String pwd = password_ctl.text;
    if (name_ctl.text.isNotEmpty &&
        name.trim() == 'saidino' &&
        pwd.trim() == 'root') {
      Get.toNamed(Routes.ADMIN);
    }
  }

  void save_user() {
    Db.write_data({'name': name_ctl.text, 'password': password_ctl.text})
        .then((value) {});
  }

  void changeThme() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);

      _is_dark.value = false;
    } else {
      (Get.changeThemeMode(ThemeMode.dark));
      _is_dark.value = true;
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            Get.isDarkMode ? Colors.greenAccent : Colors.redAccent));
  }
}

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
