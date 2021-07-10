import 'package:wizard/app/ui/utils/helpers.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
      body: SafeArea(
        child: Text('LoginController'),
      ),
    );
  }
}
