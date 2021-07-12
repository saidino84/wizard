
import 'package:get/get.dart';
import '../controllers/musicplayer_controller.dart';


class MusicplayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicplayerController>(() => MusicplayerController());
  }
}