import 'package:wizard/app/ui/utils/helpers.dart';

class AppController extends GetxController {
  final _loged = false.obs;
  final is_loged = false.obs;

  bool get user_is_loged => _loged.value;
}
