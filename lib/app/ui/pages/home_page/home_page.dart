import 'package:wizard/app/ui/utils/helpers.dart';

class HomePage extends GetView<HomeController> {
  final String? user_name;
  HomePage({this.user_name});
  @override
  Widget build(BuildContext context) {
    print('HOME PAGE');
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: SafeArea(
        child: Text('HomeController'),
      ),
    );
  }
}
