import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

/** Service to run audio in background   check audio_service documentation
 * 
 
 i removed this method from here to My MusicPlayerControler
_backgroundTaskEntryPoint() {
  // Metodo inicial para comecar ajogar os beats no background
  // este metodo de entrada colocarei la no app_controller ou directamente no music_palyer_controller
  AudioServiceBackground.run(() => AudioPlayerTask());
}

*/

class AudioPlayerTask extends BackgroundAudioTask {
  final _audioPlayer = AudioPlayer();

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    // TODO: implement onStart
    AudioServiceBackground.setState(controls: [
      MediaControl.pause,
      MediaControl.stop,
      MediaControl.skipToNext
    ], playing: true, processingState: AudioProcessingState.connecting);
    await _audioPlayer.setUrl(params!['url']);

    _audioPlayer.play();
    AudioServiceBackground.setState(
        controls: [MediaControl.pause, MediaControl.stop],
        playing: true,
        processingState: AudioProcessingState.ready);

    return super.onStart(params);
  }

  @override
  Future<void> onPlay() async {
    // TODO: implement onPlay
    AudioServiceBackground.setState(
        controls: [MediaControl.pause, MediaControl.stop],
        playing: true,
        processingState: AudioProcessingState.ready);

    await _audioPlayer.play();
    return await super.onPlay();
  }

  @override
  Future<void> onStop() async {
    // TODO: implement onStop
    AudioServiceBackground.setState(
        controls: [],
        playing: false,
        processingState: AudioProcessingState.stopped);
    await _audioPlayer.stop();
    return await super.onStop();
  }

  @override
  Future<void> onPause() async {
    AudioServiceBackground.setState(
        controls: [MediaControl.play, MediaControl.stop],
        playing: true,
        processingState: AudioProcessingState.ready);
    await _audioPlayer.pause();
    return await super.onPause();
  }
}
