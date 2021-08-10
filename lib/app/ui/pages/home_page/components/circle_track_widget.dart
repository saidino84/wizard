import 'package:wizard/app/ui/utils/helpers.dart';

class CircleTrackWidget extends GetView<MusicplayerController> {
  final String title;
  final List<Song> songs;
  final String subtitle;
  final VoidCallback notifyParent;
  final MusicplayerController mcontroller = Get.find<MusicplayerController>();

  CircleTrackWidget(
      {required this.notifyParent,
      required this.title,
      required this.songs,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 10,
            ),
            child: Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: songs.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                var song = songs[index];
                return GestureDetector(
                  onTap: () {
                    //Todo: ainda nao funciona
                    controller.current_song_list = songs;
                    mcontroller.current_song = Song(
                        artist: 'Wiizard',
                        cover_url: 'www.tourl.com',
                        songName: 'Maconde');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size.width * 0.252,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: song.cover_url != null
                              ? NetworkImage(
                                  song.cover_url!,
                                )
                              : null,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Text(
                            song.songName ?? 'Unknown',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Fuggles',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            song.artist ?? 'Unknown',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
