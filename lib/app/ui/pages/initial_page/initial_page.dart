import 'package:wizard/app/ui/utils/helpers.dart';

import 'components/body.dart';

class InitialPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('INITIAL PAGE');
    return Scaffold(
      body: Body(size: size),
    );
  }
}
