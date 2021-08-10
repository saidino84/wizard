import 'dart:math';
import 'package:wizard/app/ui/utils/helpers.dart';
import 'components/body.dart';

class HomePage extends GetView<HomeController> {
  final String? user_name;
  var mcontroller = Get.find<MusicplayerController>();
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
    );
  }
}

class HomePlaying extends GetView<MusicplayerController> {
  Song? song;
  HomePlaying({
    this.song,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(seconds: 1),
        curve: Curves.easeInToLinear,
        bottom: controller.current_song.artist != null ? 10 : -220,
        left: 10,
        right: 2,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: StreamBuilder<PlaybackState>(
              stream: AudioService.playbackStateStream,
              builder: (context, snapshot) {
                var playing = snapshot.data?.playing ?? false;
                return Container(
                  padding: EdgeInsets.all(8.0),
                  height: size.height * 0.14,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        // height: 54,
                        // width: 54,
                        child: InkWell(
                          onTap: () => Get.toNamed(Routes.MUSICPLAYER),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: controller.current_song.cover_url != null
                                  ? Image.network(
                                      controller.current_song.cover_url!)
                                  : Image.asset(
                                      'assets/images/other/song4.jpg')),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.current_song != null
                                          ? controller.current_song.artist ??
                                              'Unknown'
                                          : "NO sound so far",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      controller.current_song != null
                                          ? controller.current_song.songName ??
                                              'Unknown'
                                          : "---",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  // color: Colors.yellowAccent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            controller.stop();
                                          },
                                          icon: Icon(Icons.stop_circle_outlined,
                                              color: Colors.red),
                                        ),
                                      ),
                                      Obx(() => IconButton(
                                            onPressed: () {
                                              // controller.next_song();
                                              controller.play_pause2();
                                            },
                                            icon: Icon(
                                              controller.paused.value != true
                                                  ? Icons
                                                      .pause_circle_filled_rounded
                                                  : Icons
                                                      .play_circle_fill_rounded,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          )),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.download,
                                              color: Colors.greenAccent),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.yellowAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
