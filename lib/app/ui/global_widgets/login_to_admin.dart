import 'package:wizard/app/ui/utils/helpers.dart';

class AdminLogin extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.7,
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: Icon(
              Icons.security_outlined,
              size: 60,
              // color: context.isLandscape,
            ),
          ),
          // Text('Nome'),
          Text('Name'),

          Container(
            decoration: BoxDecoration(
              // color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: controller.name_ctl,
              decoration: InputDecoration(
                border: InputBorder.none,
                // labelText: 'Admin Nome',
                suffixIcon: Icon(
                  Icons.personal_injury_sharp,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Text('Password'),
          Text('Password'),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: controller.password_ctl,
              decoration: InputDecoration(
                border: InputBorder.none,
                // labelText: 'Admin Nome',
                suffixIcon: Icon(
                  Icons.password,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
