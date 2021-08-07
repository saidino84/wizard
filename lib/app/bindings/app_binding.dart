import 'package:wizard/app/ui/utils/helpers.dart';
// import '../controllers/musicplayer_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
  }
}
