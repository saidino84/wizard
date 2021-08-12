import 'package:get/get.dart';
import 'package:wizard/app/ui/pages/covers_page/covers_page.dart';
import 'package:wizard/app/ui/pages/songuploader_page/songuploader_page.dart';
// import 'package:wizard/app/ui/pages/home_page/components/player_widget.dart';

class AdminController extends GetxController {
  final current_tab = 0.obs;
  final is_active = false;
  final tabs = [
    CoversPage(),
    SongUploaderPage(),
  ].obs;
  void to(int tab) {
    current_tab.value = tab;
  }
}
