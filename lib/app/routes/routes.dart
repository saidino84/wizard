import 'package:wizard/app/bindings/app_binding.dart';
import 'package:wizard/app/bindings/musicplayer_binding.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class Routes {
  static final String INITIAL = '/initial';
  static final String HOME = '/';
  static final String LOGIN = '/login';
  static final String REGISTER = '/register';
  static final String UPLOAD = '/upload';
  static final String MUSICPLAYER = '/musicplayer';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
      bindings: [
        InitialBinding(),
        AppBinding(),
        MusicplayerBinding(),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [
        HomeBinding(),
        AppBinding(),
        MusicplayerBinding(),
      ],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      bindings: [
        LoginBinding(),
        AppBinding(),
      ],
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      bindings: [
        RegisterBinding(),
        AppBinding(),
      ],
    ),
    GetPage(
      name: Routes.UPLOAD,
      page: () => UploadPage(),
      bindings: [
        InitialBinding(),
        UploadBinding(),
        MusicplayerBinding(),
        AppBinding()
      ],
    ),
    GetPage(
      name: Routes.MUSICPLAYER,
      page: () => MusicplayerPage(),
      bindings: [InitialBinding(), MusicplayerBinding(), AppBinding()],
    )
  ];
}
