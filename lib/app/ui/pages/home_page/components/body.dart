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
              Container(height: 300, child: TrackWidget())
            ],
          ),
        )
      ],
    );
  }
}

class TrackWidget extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
