import 'package:wizard/app/ui/utils/helpers.dart';

class AppController extends GetxController {
  final _loged = false.obs;
  final is_loged = false.obs;
  bool get user_is_loged => _loged.value;
  final curent_index = 0.obs;
  final Rx<AssetSong> _curren_song = AssetSong(
    name: 'Falsa',
    image: 'assets/images/other/song2.jpg',
    singer: 'Wizard ft BiBowling',
    duration: 320,
    color: Colors.orange,
  ).obs;
  Rx<AssetSong> get current_song => fake_mostPopular[curent_index.value].obs;
  // Rx<AssetSong> set current_song(index) => fake_mostPopular[index];
  final current_slider = 0.0.obs;

  void next_song() {
    print('[ start]$curent_index');
    var len_songs = fake_mostPopular.length - 1;
    if (curent_index.value < len_songs) {
      curent_index.value++;
      return;
    }
    if (curent_index.value >= len_songs) curent_index.value = 0;
  }

  void change_song_duration(double d) {
    current_slider.value = d;
  }

  void chnage_song_by_index(int index) {
    curent_index.value = index;
  }
}
