import 'package:wizard/app/ui/utils/helpers.dart';

class Body extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  height: 300,
                  child: TrackWidget(
                    notifyParent: refresh,
                  ))
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

class TrackWidget extends GetView<AppController> {
  final VoidCallback notifyParent;

  TrackWidget({required this.notifyParent});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: fake_mostPopular.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            width: 200,
            // height: 50,
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
                  fake_mostPopular[index]!.image ??
                      'assets/images/other/song1.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}
