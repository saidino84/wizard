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
![Gifcurry GUI](https://i.imgur.com/SJ8zovM.gif)

# A IMPLEMENTACAO DA PARTE DA IMAGE OFUSCADA  [Na parte do player]
```dart

Container(
    margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 14,
          spreadRadius: 16,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          height: 200,
          width: size.width,
          // color: Colors.blueAccent,
        ),
      ),
    ),
  ),
```