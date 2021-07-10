import 'package:wizard/app/ui/utils/helpers.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterPage'),
      ),
      body: SafeArea(
        child: Text('RegisterController'),
      ),
    );
  }
}
