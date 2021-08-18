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
