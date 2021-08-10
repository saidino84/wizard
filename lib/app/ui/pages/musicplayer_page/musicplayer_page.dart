import 'dart:ui';

import 'package:wizard/app/ui/pages/covers_page/covers_page.dart';
import 'package:wizard/app/ui/utils/fonts.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class MusicplayerPage extends GetView<MusicplayerController> {
  Song get song_playing => controller.current_song;

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
                color: Colors.red,
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
                    image: NetworkImage(song_playing.cover_url!),
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
                      Expanded(
                        child: Container(
                          width: size.width * 0.3,
                          color: Colors.red,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            // direction: Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${song_playing.songName ?? 'Unknown'}",
                                overflow: TextOverflow.ellipsis,
                                // maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '${song_playing.artist}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    // color: controller.current_song_color.value,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.COVER);
                        },
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
                      height: size.height * 0.3,
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
                                EdgeInsets.only(left: 5, right: 5, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  // width: 150,
                                  child: Text(
                                    song_playing.songName ?? 'Unknow',
                                    // maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
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
                              "${song_playing.artist ?? 'Desconhecido'}",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppFonts.UBUNTU,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 4),
                                trackShape: RectangularSliderTrackShape(),
                                trackHeight: 6,
                              ),
                              child: Slider(
                                value: 23.0, //controller.current_slider.value,
                                activeColor: Colors.red,
                                max: 100,
                                // max: controller.current_song.value.duration
                                //     .toDouble(),
                                min: 0,
                                onChanged: (d) {
                                  // controller.change_song_duration(d);
                                },
                              ),
                            ),
                          ),

                          /**
                          Obx(
                            () => */
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Duration(seconds: 300
                                          // controller.current_slider.toInt(),
                                          )
                                      .toString()
                                      .split('.')[0]
                                      .substring(2),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  Duration(seconds: 300
                                          // controller.current_slider.toInt(),
                                          )
                                      .toString()
                                      .split('.')[0]
                                      .substring(2),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.repeat,
                                    color: Colors.white,
                                    // size: 0,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.skip_previous_rounded,
                                    color: Colors.white,
                                    // size: 0,
                                  ),
                                ),
                                Obx(() => IconButton(
                                      onPressed: () {
                                        // controller.next_song();
                                        controller.play_pause2();
                                      },
                                      icon: Icon(
                                        controller.paused.value != true
                                            ? Icons.pause_circle_filled_rounded
                                            : Icons.play_circle_fill_rounded,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                    )),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.skip_next_outlined,
                                    color: Colors.white,
                                    // size: 0,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.shuffle,
                                    color: Colors.white,
                                    // size: 0,
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
