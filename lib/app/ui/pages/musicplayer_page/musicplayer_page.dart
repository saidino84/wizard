import 'dart:ui';

import 'package:wizard/app/ui/utils/fonts.dart';
import 'package:wizard/app/ui/utils/helpers.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class MusicplayerPage extends GetView<MusicplayerController> {
  final AssetSong song_playing;
  final AppController app_controller = Get.find<AppController>();
  MusicplayerPage({
    required this.song_playing,
  });
  // MusicplayerPage create() => MusicplayerPage();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: kToolbarHeight,
                width: size.width * 0.8,
                color: Colors.white24,
              ),
            ),
            Hero(
              tag: 'image',
              child: Container(
                // child: Text('MusicplayerController'),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(song_playing.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: kToolbarHeight,
                  width: size.width * 0.98,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white38,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 33,
                        spreadRadius: 6,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            '${song_playing.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Obx(
                            () => Text(
                              '${song_playing.singer}',
                              style: TextStyle(
                                fontSize: 13,
                                color: app_controller.current_song_color.value,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,
                      spreadRadius: 16,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      height: 200,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white.withOpacity(1.0),
                        ),
                      ),
                      // color: Colors.blueAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  song_playing.name,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFonts.BrushH,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
