import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationConfigure {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  void configure() {
    // _fcm.
  }

  void getmessages() async {
    NotificationSettings settings = await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        provisional: false,
        criticalAlert: false,
        sound: true);
    print("User granted ${settings.authorizationStatus}");
  }
}
