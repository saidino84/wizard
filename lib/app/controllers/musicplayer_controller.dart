import 'package:get/get.dart';
import 'package:wizard/app/data/models/song.dart';
import 'package:wizard/app/data/services/song_repository.dart';

class MusicplayerController extends GetxController {
  var repository = SongRepository();
  final Rx<Song> _current_song = Song().obs;

  final _current_song_list = <Song>[].obs;
  List<Song> get current_song_list => _current_song_list.value;
  void set current_song_list(List<Song> list) => _current_song_list.value;
  void set current_song(Song song) => _current_song.value = song;
  Song get current_song => _current_song.value;

  Stream<List<Song>> allSongs() => repository.getSongs();

  void change_song_by_index(int index) {}
}
