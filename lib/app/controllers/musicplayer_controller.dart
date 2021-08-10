import 'package:just_audio/just_audio.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class MusicplayerController extends GetxController {
  late ConcatenatingAudioSource _playlist; //criando playlist com just_audio
// ignore: slash_for_doc_comments
/**One benefit of using ConcatenatingAudioSource 
is that it allows gapless playback
for the media items it contains.
That means you don’t need to wait 
for the next song to load when the previous song finishes. 
The playlist will prefetch it.

Now find the _setInitialPlaylist method and replace it with with the following code:

*/
  var repository = SongRepository();
  final Rx<Song> _current_song = Song().obs;
  final _current_song_list = <Song>[].obs;
  List<Song> get current_song_list => _current_song_list.value;
  void set current_song_list(List<Song> list) => _current_song_list.value;
  void set current_song(Song song) => _current_song.value = song;
  Song get current_song => _current_song.value;

  Stream<List<Song>> allSongs() => repository.getSongs();

  Future<Song> get_song() async {
    List<Song> output = await repository.getSongs().single;
    print('songs got allrigth');
    _current_song.value = output.first;
    return output.first;
  }

  // pelo facto de AudioService acima setado nao jobar vou trabalhar com music player sem precisar dele apos implemento

  final _audio_player = AudioPlayer();
  final playing = false.obs;
  Rx<bool?> paused = null.obs;

  Future<int> songs_length() async {
    var songs = await allSongs().single;
    return songs.length;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    _setInitialPlaylist();
    Get.snackbar('play list loaded', 'plaing', onTap: (e) {
      _audio_player.play();
    });
    super.onReady();
  }

  void playSound_2() async {
    if (current_song.songUrl != null) {
      await _audio_player.setUrl(current_song.songUrl!).then((duration) {
        paused = false.obs;
        Get.snackbar(
          'playSound_2',
          'Sucessfull Url set done ! song with duration :$duration',
          backgroundColor: Colors.green[700],
        );
      }).catchError((e) {
        Get.snackbar('playSond_2', '[on_setUrl :Err] $e',
            backgroundColor: Colors.red);
      });
      await _audio_player.play().then((value) {
        print('playing');
        playing.value = true;
        Get.snackbar('playSound_2', 'Playing song with  ',
            backgroundColor: Colors.green[700],
            snackPosition: SnackPosition.BOTTOM);
      }).catchError((e) {
        Get.snackbar('playSond_2', '[on_play :Err] $e',
            backgroundColor: Colors.red);
      });
    }
  }

  void play_pause2() {
    try {
      if (paused.value == false) {
        _audio_player.pause();
        playing.value = false;
        paused.value = true;
        print('pausado  ${paused.value}');
      } else {
        _audio_player.play();
        playing.value = true;
        paused.value = false;
        print('pausado  ${paused.value}');
      }
    } on Exception catch (e) {
      Get.snackbar('Play-Pause', '$e', backgroundColor: Colors.red);
    }
  }

  void stop() {
    _audio_player.stop();
  }

  Future skip_to_next_song() async {
    await _audio_player.seekToNext().catchError((e) {});
  }

  Future skip_to_prev_song() async {
    await _audio_player.seekToPrevious().catchError((e) {});
  }

  void _setInitialPlaylist() async {
    var songs = await allSongs().single;
    // AudioSource.uri()
    var audios = songs
        .map((song) =>
            AudioSource.uri(Uri.parse(song.songUrl!), tag: '${song.songName}'))
        .toList();
    // _playlist = ConcatenatingAudioSource(children: songs.map((song) => AudioSource.uri(song.songUrl!));
    _playlist = ConcatenatingAudioSource(
      children: audios,
    );
    _audio_player.setAudioSource(_playlist);
    // _audio_player.play();
  }
}
