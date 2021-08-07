import 'package:firebase_core/firebase_core.dart';
import 'package:wizard/app/bindings/app_binding.dart';
import 'package:wizard/app/routes/routes.dart';

import 'app/ui/utils/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends GetView<AppController> {
  // AppController controller=Get.lazyPut<AppController>( AppController()),
  AppController controller = Get.put<AppController>(AppController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Saidino Tricks',
      debugShowCheckedModeBanner: false,
      initialRoute: controller.user_is_loged ? Routes.INITIAL : Routes.HOME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Pages.pages,
      initialBinding: AppBinding(),
    );
  }
}
