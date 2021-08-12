import 'package:cached_network_image/cached_network_image.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

class CircleTrackWidget extends GetView<MusicplayerController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<List<Song>>(
      stream: controller.allSongs(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some thik was wrong :\n ${snapshot.error}'));
            } else {
              List<Song> songs = snapshot.data!;
              return Container(
                  height: size.height * 0.4,
                  child: FullPlayList(songs: songs, size: size));
            }
        }
      },
    );
  }
}

class FullPlayList extends StatelessWidget {
  const FullPlayList({
    Key? key,
    required this.songs,
    required this.size,
  }) : super(key: key);

  final List<Song> songs;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        var song = songs[index];
        return Item(
          song: song,
        );
      },
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
          child: CachedNetworkImage(
        imageUrl: song.cover_url ?? '',
        imageBuilder: (ctx, imageProv) => Container(
          height: 50,
          width: 50,
          // alignment: Alignment(0, 0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProv,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  context.theme.primaryColor, BlendMode.colorBurn),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        placeholder: (ctx, url) => CircularProgressIndicator(),
        errorWidget: (ctx, exception, err) {
          return Container(
            width: 50,
            height: 50,
            alignment: Alignment(0, 0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      )),
      title: Text(
        song.songName!,
      ),
      subtitle: Text(
        song.artist ?? 'Desconhecido',
        style: TextStyle(color: Colors.grey),
      ),
      // isThreeLine: true,
      selectedTileColor: context.theme.primaryColor,
      trailing: IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({
    Key? key,
    required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KDefaultPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CachedNetworkImage(
            imageUrl:
                '${song.cover_url}9', //!, //"http://via.placeholder.com/200x150",
            imageBuilder: (context, imageProvider) {
              return Container(
                // margin: EdgeInsets.all(10),

                width: 50,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // color: fake_mostPopular[index].color,
                        blurRadius: 1,
                        spreadRadius: 0.3,
                      ),
                    ],
                    image: song.cover_url != null
                        ? DecorationImage(
                            image:
                                // song.cover_url!,
                                imageProvider,
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: fake_mostPopular[2].color),
                child: Text('${song.artist}', overflow: TextOverflow.ellipsis),
              );
            },
            placeholder: (ctx, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (ctx, url, err) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
