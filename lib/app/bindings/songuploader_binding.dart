
import 'package:get/get.dart';
import '../controllers/songuploader_controller.dart';


class SonguploaderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SonguploaderController>(() => SonguploaderController());
  }
}