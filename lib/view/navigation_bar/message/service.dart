import 'dart:developer';
import 'package:flutter/painting.dart';
import 'package:grock/grock.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;

  void settingNotification() async {
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void connectNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    FirebaseMessaging.onBackgroundMessage(backgroundMessage);

    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(
          title: '${event.notification?.title}',
          description: '${event.notification?.body}',
          opacity: 0.5,
          position: SnackbarPosition.top,
          borderRadius: BorderRadius.circular(10));
    });

    messaging
        .getToken()
        .then((value) => log('Token: $value', name: 'FCM Token'));
  }

  static Future<void> backgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }
}
