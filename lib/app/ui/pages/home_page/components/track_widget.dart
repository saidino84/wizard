import 'dart:math';

import 'package:wizard/app/ui/utils/helpers.dart';

class TrackWidget extends GetView<MusicplayerController> {
  final VoidCallback notifyParent;
  final Size size;

  TrackWidget({required this.notifyParent, required this.size});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Song>>(
        stream: controller.allSongs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Get.defaultDialog(
              title: 'Houve um erro',
              content: Text('${snapshot.error}'),
            );
            return ListError(
              size: size,
              error: snapshot.error,
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              {
                if (snapshot.hasData) {
                  debugPrint('SIM TEM DADOS');
                  print(
                      'SIM TEM DADOS DENTRO ${snapshot.data!.last.cover_url}');
                  List<Song> songs = snapshot.data!;
                  if (songs.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Lista Vazia',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    );
                  } else
                    return WizardSongList(songs: songs);
                }
                return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, snapshot) {
                    return Container(
                      child: Center(
                        child: Text('<Sem songs>'),
                      ),
                    );
                  },
                );
              }
            case ConnectionState.waiting:
              {
                return LoadingWidget(size: size);
              }
            case ConnectionState.done:
              {
                return Center(
                  child: Text('Conection state done ...'),
                );
              }
            default:
              return Container();
          }
        });
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.all(10),
            width: size.width * 0.390,
            // height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: [
                    Color(0xffF44336),
                    Color(0xffFF5722),
                    Color(0xff3F51B5),
                    Color(0xffFF9800)
                  ][Random().nextInt(4)],
                  blurRadius: 1,
                  spreadRadius: 0.3,
                ),
              ],
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            ),
          );
        });
  }
}

class ListError extends StatelessWidget {
  final error;
  ListError({
    Key? key,
    required this.error,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.all(10),
            width: size.width * 0.390,
            // height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Ocorreu um erro ${error}'),
          );
        });
  }
}

class WizardSongList extends GetView<MusicplayerController> {
  final List<Song>? songs;
  const WizardSongList({Key? key, required this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: songs!.length,
      itemBuilder: (context, index) {
        Song song = songs![index];
        return GestureDetector(
          onTap: () {
            print('Tracando o song');
            // controller.chnage_song_by_index(index);
            controller.current_song = song;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                // margin: EdgeInsets.all(10),
                width: size.width * 0.390,
                // height: 150,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // color: fake_mostPopular[index].color,
                        blurRadius: 1,
                        spreadRadius: 0.3,
                      ),
                    ],
                    image: song.cover_url != null
                        ? DecorationImage(
                            image: NetworkImage(
                              song.cover_url!,
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: fake_mostPopular[2].color),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
