import 'package:get/get.dart';
import 'package:wizard/app/data/services/song_repository.dart';
import '../controllers/musicplayer_controller.dart';

class MusicplayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicplayerController>(() => MusicplayerController());
    Get.lazyPut<SongRepository>(() => SongRepository());
  }
}
