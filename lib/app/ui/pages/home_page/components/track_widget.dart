import 'package:wizard/app/ui/utils/helpers.dart';

class TrackWidget extends GetView<AppController> {
  final VoidCallback notifyParent;
  Size size;

  TrackWidget({required this.notifyParent, required this.size});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: fake_mostPopular.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Tracando o song');
              controller.chnage_song_by_index(index);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: size.width * 0.390,
              // height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: fake_mostPopular[index].color,
                      blurRadius: 1,
                      spreadRadius: 0.3,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      fake_mostPopular[index].image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: fake_mostPopular[index].color),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fake_mostPopular[index].name,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        // fontSize: 42,
                      ),
                    ),
                    Text(
                      fake_mostPopular[index].singer,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        // fontSize: 42,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
