# wizard
Aplicativo para meu nigga rapper Benildo aka Wizard

```dart
GetX controller
class Controller extends GetxController {
	
  @override
  void onInit() { // called immediately after the widget is allocated memory
    fetchApi();
    super.onInit();
  }

  @override
  void onReady() { // called after the widget is rendered on screen
    showIntroDialog();
    super.onReady();
  }

  @override
  void onClose() { // called just before the Controller is deleted from memory
    closeStream();
    super.onClose();
  }

}


```