import 'package:wizard/app/ui/utils/helpers.dart';
import '../../../controllers/admin_controller.dart';

class AdminPage extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina do Admisnistrador'),
        elevation: 0,
      ),
      body: Obx(
        () => controller.tabs.value[controller.current_tab.value],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.grey[800]),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {
                  controller.to(0);
                },
                icon: Icon(Icons.home,
                    color: controller.current_tab == 0
                        ? primaryColor
                        : Colors.grey[500]),
                label: Text('home',
                    style: TextStyle(
                        color: controller.current_tab == 0
                            ? primaryColor
                            : Colors.grey[500])),
              ),
              TextButton.icon(
                onPressed: () {
                  controller.to(1);
                },
                icon: Icon(Icons.upload_file,
                    color: controller.current_tab.value == 1
                        ? primaryColor
                        : Colors.grey[500]),
                label: Text('upload',
                    style: TextStyle(
                        color: controller.current_tab.value == 1
                            ? primaryColor
                            : Colors.grey[500])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
