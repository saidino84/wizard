import 'package:wizard/app/ui/utils/helpers.dart';

class UploadPage extends GetView<UploadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadPage'),
      ),
      body: SafeArea(
        child: Text('UploadController'),
      ),
    );
  }
}
