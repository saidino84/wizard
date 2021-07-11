import 'package:wizard/app/ui/utils/helpers.dart';

class Body extends GetView<HomeController> {
  final Size size;
  Body({required this.size});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/wizard_pics/wzard_2.jpg'),
          ),
        ),
        child: Stack(
          children: [
            // top-black-container
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height * 0.071,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 22, blurRadius: 23),
                  ],
                ),
              ),
            ),
            Align(
              // left: 0,
              // right: 0,
              // bottom: 0,
              // height: size.height * 0.64,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Wizard ',
                      style: TextStyle(
                        fontFamily: 'Fuggles',
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Beats',
                      style: TextStyle(
                        fontFamily: 'Fuggles',
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: size.height * 0.52,
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/soud_wav2.png',
                      ),
                      Image.asset(
                        'assets/images/smashed.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // black-bottom-container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: size.height * 0.11,
              child: Container(
                  decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black, spreadRadius: 18, blurRadius: 33),
              ])),
            ),

            // black-bottom-container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: size.height,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red.withOpacity(0.3),
                        spreadRadius: 18,
                        blurRadius: 33),
                  ],
                ),
              ),
            ),
            Positioned(
              // alignment: Alignment.bottomCenter,
              bottom: 50, left: 8, right: 8,
              height: size.height * 0.11,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onLongPress: () => Get.toNamed(Routes.HOME),
                  onTap: () => Get.defaultDialog(
                      title: '',
                      content: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(21),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'assets/images/wizard_pics/wzard_3_mini.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                              'Ya socio falta muita coisa aqui para implementar brow ! apenas relaxe',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextStyle(
                                  // fontFamily: 'Fuggles',
                                  // fontSize: 24,
                                  )),
                        ],
                      )),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: size.height * 0.072,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorDarkColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Explorar ',
                      style: TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontFamily: 'Righteous',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
