import 'package:firebase_core/firebase_core.dart';
import 'package:wizard/app/bindings/app_binding.dart';
import 'package:wizard/app/routes/routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wizard/app/theme/app_theme.dart';

import 'app/ui/utils/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
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
      // theme: Themes.light, //ThemeData.light(),
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context), //Themes.dark,
      getPages: Pages.pages,
      initialBinding: AppBinding(),
      themeMode: ThemeMode.system,
    );
  }
}

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: Colors.redAccent,
    backgroundColor: Colors.white,
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: Colors.greenAccent,
    backgroundColor: Colors.white,
  );
}
