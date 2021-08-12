import 'dart:math';
import 'package:wizard/app/ui/utils/helpers.dart';
import 'components/body.dart';
import 'components/home_playing.dart';

class HomePage extends GetView<HomeController> {
  final String? user_name;
  var mcontroller = Get.find<MusicplayerController>();
  HomePage({this.user_name});
  @override
  Widget build(BuildContext context) {
    print('HOME PAGE');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Wizzard',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
              ),
              Obx(() => Text(
                    'Pemba ${mcontroller.current_song.artist}',
                    style: TextStyle(fontSize: 15, fontFamily: 'Sacramento'),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  Icons.notifications_active_outlined,
                ),
                onPressed: () => Get.snackbar(
                    'Notificacoes',
                    Strings.on_tab_notiy_test[
                        Random().nextInt(Strings.on_tab_notiy_test.length)])),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Body(size),
            HomePlaying(size: size, song: null),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
