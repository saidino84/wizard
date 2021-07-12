import 'package:wizard/app/ui/utils/helpers.dart';

class CircleTrackWidget extends GetView<AppController> {
  final String title;
  final List<AssetSong> songs;
  final String subtitle;
  final VoidCallback notifyParent;

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
                    controller.current_song_list.value = songs;
                    controller.chnage_song_by_index(index);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: size.width * 0.252,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            song.image,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          song.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Fuggles',
                          ),
                        ),
                        Text(
                          song.singer,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white54,
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
