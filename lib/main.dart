import 'package:wizard/app/routes/routes.dart';

import 'app/ui/utils/helpers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    var app_controller = Get.put(AppController());
    print(app_controller.user_is_loged);
    return GetMaterialApp(
      title: 'Saidino Tricks',
      debugShowCheckedModeBanner: false,
      initialRoute: app_controller.user_is_loged ? Routes.HOME : Routes.INITIAL,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Pages.pages,
    );
  }
}
