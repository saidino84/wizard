import 'package:wizard/app/ui/utils/helpers.dart';

class UploadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadController>(() => UploadController());
  }
}
