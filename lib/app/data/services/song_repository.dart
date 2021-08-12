import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wizard/app/data/models/song.dart';

class SongRepository {
  final CollectionReference song_reference =
      FirebaseFirestore.instance.collection('admin');
  // song_reference.
  final reference = FirebaseStorage.instance.ref();

  var image_song_uri = <String, String>{};
  var image_uploaded = false;
  var audio_uploaded = false;

  List<Song> songFromFirebase_api(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((song_json) {
        Map<String, dynamic> dada = song_json.data() as Map<String, dynamic>;
        return Song.fromJson(dada).copyWith(uid: song_json.id);
      }).toList();
    }
    return [];
  }

  Stream<List<Song>> getSongs() {
    return song_reference.snapshots().map(songFromFirebase_api);
  }

  Future<bool> upload_image_e_audio_file(
      {required Uint8List image_data,
      required String image_path,
      required Uint8List audio_data,
      required String audio_path,
      required String title,
      required String artist,
      required bool is_solo}) async {
    image_uploaded = false;
    audio_uploaded = false;
    print('stared uploads');
    Song song = Song(artist: artist, songName: title, isSolo: is_solo);

    //UPLAOD DE IMAGE no cloud-storage do firebase flutfirebase/covers/
    final cover_ref =
        FirebaseStorage.instance.ref('flutfirebase/covers/$image_path');
    var cover_task = cover_ref.putData(image_data);
    var cover_uri = await SongRepository.get_uploaded_file_uri(cover_task);

    if (cover_uri != null) {
      song = song.copyWith(songUrl: cover_uri);
      image_uploaded = true;

      // IMAGE JA FOI FEITA UPLOAD COM SUCESSO
    }

    //FAZENDO UPLOAD DO AUDIO

    final song_ref =
        FirebaseStorage.instance.ref('flutfirebase/songs/$audio_path');
    var song_task = song_ref.putData(audio_data);
    var song_uri = await SongRepository.get_uploaded_file_uri(song_task);
    if (song_uri != null) {
      song = song.copyWith(songUrl: song_uri);
      audio_uploaded = true;
    }
    return save_song_to_cloud_firestore(song);
  }

  static Future<String?> get_uploaded_file_uri(UploadTask cov_task) async {
    if (cov_task != null) {
      final snapshot = await cov_task.whenComplete(() {});
      final uri_downloaded = await snapshot.ref.getDownloadURL();
      return uri_downloaded;
    }
    return null;
  }

  Future<bool> save_song_to_cloud_firestore(Song song) async {
    if (audio_uploaded && image_uploaded) {
      await song_reference.add(song.toJson());
      return true;
    }
    return false;
  }
}
