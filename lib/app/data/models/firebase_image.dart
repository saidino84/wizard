import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImage {
  final Reference ref;
  final String name;
  final String url;
  const FirebaseImage(
      {required this.ref, required this.name, required this.url});
}
