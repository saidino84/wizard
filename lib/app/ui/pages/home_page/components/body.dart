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
    var primaryColor = Theme.of(context).primaryColor;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(left: KDefaultPadding, bottom: 10),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: kToolbarHeight,
              left: 0,
              right: 0,
              child: Container(
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Curta os Beats',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ListSongCategorysWidget(size: size),
                      Container(
                        height: size.height * 0.350,
                        child: TrackWidget(
                          size: size,
                          notifyParent: refresh,
                        ),
                      ),
                      SizedBox(child: CircleTrackWidget()),
                    ],
                  ),
                ),
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

class ListSongCategorysWidget extends StatelessWidget {
  const ListSongCategorysWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: size.width,
      // color: context.theme.accentColor,
      color: Get.isDarkMode ? Colors.transparent : Colors.grey[200],
      child: ListView(scrollDirection: Axis.horizontal, children: [
        SongCategoryWidget(title: 'Category 1'),
        SizedBox(width: 20),
        SongCategoryWidget(title: 'Category 2'),
        SizedBox(width: 20),
        SongCategoryWidget(title: 'Category 3'),
      ]),
    );
  }
}

class SongCategoryWidget extends StatelessWidget {
  const SongCategoryWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Container(height: 4.0, width: 50, color: context.theme.primaryColor),
        ],
      ),
    );
  }
}
