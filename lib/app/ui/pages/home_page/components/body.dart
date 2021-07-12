import 'dart:math';

import 'package:wizard/app/ui/utils/helpers.dart';

import 'circle_track_widget.dart';
import 'player_widget.dart';
import 'track_widget.dart';

class Body extends GetView<AppController> {
  final Size size;

  Body(this.size);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  '960 Playlists',
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
                songs: fake_new_release,
                title: 'Beats Recentes',
                subtitle: '2456 songs',
                notifyParent: refresh,
              ),
              SizedBox(height: 34),
              Obx(() => Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      color: controller.current_song.value.color,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          controller.current_song.value.color,
                        ],
                      ),
                    ),
                    child: Container(
                      height: 40,
                      width: 50,
                      child: ClipRRect(
                        child: Image.asset(
                          controller.current_song.value.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
              CircleTrackWidget(
                songs: [...fake_mostPopular, ...fake_new_release],
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
              Obx(() => Align(
                    alignment: Alignment.bottomLeft,
                    child:
                        PlayerHome(current_song: controller.current_song.value),
                  )),
            ],
          ),
        )
      ],
    );
  }

  refresh() {
    print('hi');
  }
}
