
import 'package:get/get.dart';
import '../controllers/covers_controller.dart';


class CoversBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoversController>(() => CoversController());
  }
}