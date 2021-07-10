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

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: size.height * 0.54,
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/soud_wav2.png',
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.redAccent,
                          ),
                        ),
                        child: Text('Get Started'),
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
                  decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.red.withOpacity(0.3),
                    spreadRadius: 18,
                    blurRadius: 33),
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
