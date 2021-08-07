import 'dart:math';

import 'package:wizard/app/ui/utils/helpers.dart';

import 'circle_track_widget.dart';
import 'player_widget.dart';
import 'track_widget.dart';

// MusicplayerController
class Body extends GetView<AppController> {
  final Size size;

  Body(this.size);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Mais',
                      style: TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(
                      'Tocadas',
                      style: TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      top: 5,
                      bottom: 20,
                    ),
                    child: Text(
                      '${fake_new_release.length} Songs',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Fuggles',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.350,
                    child: TrackWidget(
                      size: size,
                      notifyParent: refresh,
                    ),
                  ),
                  CircleTrackWidget(
                    // songs: fake_new_release,
                    songs: <Song>[],
                    title: 'Beats Recentes',
                    subtitle: '2456 songs',
                    notifyParent: refresh,
                  ),
                  SizedBox(height: 34),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: controller.current_song.value.color,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.black
                          // controller.current_song.value.color,
                        ],
                      ),
                    ),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: ClipRRect(
                        child: Image.asset(
                          'assets/images/mic.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  CircleTrackWidget(
                    songs: <Song>[],
                    title: 'Beats Favoritas',
                    subtitle: '${[
                      ...fake_mostPopular,
                      ...fake_new_release
                    ].length} songs',
                    notifyParent: refresh,
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  // Obx(
                  //   () => Align(
                  //     alignment: Alignment.bottomLeft,
                  //     child:
                  //         PlayerHome(current_song: controller.current_song.value),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  refresh() {
    print('hi');
  }
}
