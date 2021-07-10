import 'package:wizard/app/ui/utils/helpers.dart';

class Routes {
  static final String INITIAL = '/initial';
  static final String HOME = '/';
  static final String LOGIN = '/login';
  static final String REGISTER = '/register';
  static final String UPLOAD = '/upload';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
      bindings: [
        InitialBinding(),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [
        InitialBinding(),
        HomeBinding(),
      ],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      bindings: [
        InitialBinding(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      bindings: [
        InitialBinding(),
        RegisterBinding(),
      ],
    ),
    GetPage(
      name: Routes.UPLOAD,
      page: () => UploadPage(),
      bindings: [
        InitialBinding(),
        UploadBinding(),
      ],
    ),
  ];
}
