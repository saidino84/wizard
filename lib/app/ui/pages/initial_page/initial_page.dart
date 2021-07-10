import 'package:wizard/app/ui/utils/helpers.dart';

class InitialPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InitialPage'),
      ),
      body: SafeArea(
        child: Text('InitialController'),
      ),
    );
  }
}
