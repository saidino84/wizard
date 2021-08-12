import 'package:permission_handler/permission_handler.dart';

class AppPermisions {
  static storage_permision() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }
}
