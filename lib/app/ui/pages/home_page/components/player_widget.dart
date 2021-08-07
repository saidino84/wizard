import 'package:wizard/app/ui/utils/helpers.dart';

class PlayerHome extends GetView<MusicplayerController> {
  final AssetSong current_song;

  PlayerHome({required this.current_song});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => MusicplayerPage());
        },
        child: Container(
          height: 130,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            // color: Colors.black.withOpacity(0.3),
            // color: controller.current_song_color.value,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.black38,
                // controller.current_song_color.value
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: 'image',
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            current_song.image,
                          ),
                          radius: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            current_song.name,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            current_song.singer,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // controller.next_song();
                        },
                        icon: Icon(
                          Icons.skip_next_outlined,
                          color: Colors.white,
                          // size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.pause,
                          color: Colors.white,
                          // size: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    Duration(seconds: 3000
                            // controller.current_slider.value.toInt()
                            )
                        .toString()
                        .split('.')[0]
                        .substring(2),
                    style: TextStyle(color: Colors.white54),
                  ),
                  Container(
                    width: size.width - 120,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 4),
                          trackShape: RectangularSliderTrackShape(),
                          trackHeight: 4),
                      child: Slider(
                        value: 23.1,
                        activeColor: Colors.white,
                        // max: controller.current_song.value.duration.toDouble(),
                        // value: controller.current_slider.value,
                        min: 0,
                        onChanged: (d) {
                          // controller.change_song_duration(d);
                        },
                      ),
                    ),
                  ),
                  Text(
                    // Duration(seconds: controller.current_song.value.duration)
                    Duration(seconds: 3000
                            // /controller.current_song.value.duration
                            )
                        .toString()
                        .split('.')[0]
                        .substring(2),
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
