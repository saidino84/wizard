import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wizard/app/data/models/song.dart';

class SongRepository {
  final CollectionReference song_reference =
      FirebaseFirestore.instance.collection('admin');
  // song_reference.

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

  // Stream<List<Song>> getCurrentSong() {

  // }
}
