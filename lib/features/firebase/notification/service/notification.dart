import 'package:firebase_messaging/firebase_messaging.dart';

class Notification {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    final settings = await messaging.requestPermission();
    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> sendTokenToServer() async {
    final token = await messaging.getToken();
    print('Token: $token');
  }
}
