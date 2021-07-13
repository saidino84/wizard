import 'dart:ui';

import 'package:wizard/app/ui/utils/fonts.dart';
import 'package:wizard/app/ui/utils/helpers.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class MusicplayerPage extends GetView<AppController> {
  final AssetSong song_playing;
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
                                color: controller.current_song_color.value,
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
                                EdgeInsets.only(left: 5, right: 5, top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  child: Text(
                                    song_playing.name,
                                    // maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppFonts.FUNGGLES,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.cloud_download_outlined,
                                        color: Colors.orange,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              song_playing.singer,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppFonts.UBUNTU,
                              ),
                            ),
                          ),
                          Obx(
                            () => Container(
                              width: size.width,
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 4),
                                  trackShape: RectangularSliderTrackShape(),
                                  trackHeight: 6,
                                ),
                                child: Slider(
                                  value: controller.current_slider.value,
                                  activeColor: Colors.red,
                                  max: controller.current_song.value.duration
                                      .toDouble(),
                                  min: 0,
                                  onChanged: (d) {
                                    controller.change_song_duration(d);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Duration(
                                      seconds:
                                          controller.current_slider.toInt(),
                                    ).toString().split('.')[0].substring(2),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    Duration(
                                      seconds:
                                          controller.current_slider.toInt(),
                                    ).toString().split('.')[0].substring(2),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
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
