import 'package:get/get.dart';
import 'package:wizard/app/data/models/song.dart';
import 'package:wizard/app/data/services/song_repository.dart';

class MusicplayerController extends GetxController {
  var repository = SongRepository();

  Stream<List<Song>> allSongs() => repository.getSongs();
}
