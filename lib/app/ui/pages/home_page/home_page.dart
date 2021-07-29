import 'dart:math';
import 'package:wizard/app/ui/utils/helpers.dart';
import 'components/body.dart';

class HomePage extends GetView<HomeController> {
  var music_controller = Get.find<MusicplayerController>();
  final String? user_name;

  HomePage({this.user_name});
  @override
  Widget build(BuildContext context) {
    print('HOME PAGE');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[900],
        elevation: 0,
        leading: Icon(
          Icons.search,
        ),
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
              Text(
                'Pemba',
                style: TextStyle(fontSize: 15, fontFamily: 'Sacramento'),
              ),
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
      body: SafeArea(child: Body(size)),
    );
  }
}
