import 'package:wizard/app/data/services/song_repository.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class UploadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadController>(() => UploadController());
  }
}
