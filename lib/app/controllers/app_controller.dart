import 'package:palette_generator/palette_generator.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class AppController extends GetxController {
  final _loged = false.obs;
  final is_loged = false.obs;
  final current_song_list = fake_mostPopular.obs;
  final current_song_color = Color(0xffc2c2c2).obs;

  bool get user_is_loged => _loged.value;
  final curent_index = 0.obs;

  Rx<AssetSong> get current_song =>
      current_song_list.value[curent_index.value].obs;
  // Rx<AssetSong> set current_song(index) => fake_mostPopular[index];
  final current_slider = 0.0.obs;

  void next_song() {
    print('[ start]$curent_index');
    var len_songs = current_song_list.value.length - 1;
    if (curent_index.value < len_songs) {
      curent_index.value++;
      update_palete_colors();
      return;
    }
    if (curent_index.value >= len_songs) curent_index.value = 0;
    update_palete_colors();
  }

  void update_palete_colors() async {
    print('CURRENT SONG IS ${current_song.value.name}');
    final PaletteGenerator color_generator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(current_song.value.image),
      size: Size(400, 300),
    );

    final cor = color_generator.lightMutedColor ?? PaletteColor(Colors.blue, 2);
    // current
    current_song_color.value = cor.color;
  }

  void change_song_duration(double d) {
    current_slider.value = d;
    update_palete_colors();
  }

  void chnage_song_by_index(int index) {
    curent_index.value = index;
    update_palete_colors();
  }

  void generate_image_pallete() {}
}
