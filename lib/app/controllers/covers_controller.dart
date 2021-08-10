import 'package:get/get.dart';
import 'package:wizard/app/data/models/firebase_image.dart';
import 'package:wizard/app/data/services/firebase_image_test_api.dart';

class CoversController extends GetxController {
  final repository = FirebaseApi();
  late Future<List<FirebaseImage>> futurefiles;

  @override
  void onInit() {
    // TODO: implement onInit

    futurefiles = FirebaseApi.listAll('flutfirebase/covers/');
    super.onInit();
  }
}
