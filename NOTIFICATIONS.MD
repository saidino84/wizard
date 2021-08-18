# CRIANDO NOTIFICATIONS COM FIREBASE MENSAGING
Como agente cria uma notification com firebase messaging the
# Esta parte nao precisaos mexer no codigo nativo
>>a pos ter configurado o firebase no grandle. do app adicionando as dependencias de:
```grandle
dependency
  implementation platform('com.google.firebase:firebase-bom:28.3.0')
    implementation 'com.android.support:multidex:2.0.1'
    implementation 'com.google.firebase:firebase-messaging' #importante for firebase_messaging
    implementation 'com.google.firebase:firebase-analytics' # importante for firebase_analytics to receive your notifiations send from web or any way
    }
```
>>
```yaml
# //NOTIFICATIONS FIREBASE
  firebase_messaging: ^10.0.4
  # //LOCAIS
  flutter_local_notifications: ^8.1.1+1
```

<!-- AppNotificationApi -->
# ACLASSE RESPONSAL POR ESTAR ESCUTANDO AS NOTIFICATIONS

```dart

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationApi {
  final AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', //id
      'High importance Notifications', //title
      'This is chanel is used for importance notificatios', //description
      importance: Importance.high, //

      playSound: true);

  FlutterLocalNotificationsPlugin localnotify_plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init_platform_configs() async {
    //Starting handling onBackgroundMessaging handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Starting localnotification
    await localnotify_plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  void startListenningNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? _notification = message.notification;
      AndroidNotification? _android = message.notification?.android;

      if (_notification != null && _android != null) {
        localnotify_plugin.show(
          _notification.hashCode,
          _notification.title,
          _notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.blue,
              playSound: true,
              //leave image to your @assets/@drawable/ic_launcher.png
              icon: "@mipmap/saidin_icon",
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Get.snackbar('New On message', '${message.category}',
          backgroundColor: Colors.yellow);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        Get.defaultDialog(
            title: 'AppNotification APi',
            content: Text('${notification.body}'));
      }
    });
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // await Firebase.initializeApp(); ..ja foi feito no app ao iniciar

    print('A BG message jsut showed up : ${message.messageId}');
  }


<!-- Use this function to call onPressed:()=>AppNotification().show_simple_local_notification('e ai') -->
  void show_simple_local_notification(String message) {
    localnotify_plugin.show(
      // int ia
      0,
      //string title
      "Testeing this is a title",
      //body Strings
      "How do you doing",
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
          importance: Importance.high,
          color: Colors.yellowAccent,
          icon: "@mipmap/saidin_icon",
        ),
      ),
    );
  }
}



```

# Antes de fazer run o app por favor leve em consideracao as seguintes confguracoes
```dart
void main() async {
  NotificationApi notifyapi =
      NotificationApi(); //inicnao a minha api de push_notificatios

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Iniciando escutar ao backgraound os pushs do firebaseMessagingBackgroundHandler
  notifyapi.init_platform_configs();
  runApp(MyApp());
}

```

# SO ON YOU APP IS READ TO HANDLE WHEN OPENED OR NOT IT WILL RECEIVE NOTIFICATIONS WHOREVER