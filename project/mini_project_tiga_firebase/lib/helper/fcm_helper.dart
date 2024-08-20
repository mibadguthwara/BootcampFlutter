import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'notification_helper.dart';

class FcmHelper {
  Future<void> init() async {
    await FirebaseMessaging.instance.requestPermission();

    final fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint("FCM TOKEN: $fcmToken");

    FirebaseMessaging.instance.getInitialMessage().then(
      (value) {
        NotificationHelper.payload.value = jsonEncode(
          {
            "title": value?.notification?.title,
            "body": value?.notification?.body,
            "data": value?.data,
          },
        );
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (value) {
        NotificationHelper.payload.value = jsonEncode(
          {
            "title": value.notification?.title,
            "body": value.notification?.body,
            "data": value.data,
          },
        );
      },
    );

    // handle notification jika ditekan dari kondisi app dibuka
    FirebaseMessaging.onMessage.listen(
      (message) async {
        // Data notifikasi
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        // jika notifikasi masuk dan platform adalah android
        if (notification != null && android != null && !kIsWeb) {
          // tampilkan notifikasi menggunakan local notification
          await NotificationHelper.flutterLocalNotificationsPlugin.show(
            Random().nextInt(99),
            notification.title,
            notification.body,
            payload: jsonEncode(
              {
                "title": notification.title,
                "body": notification.body,
                "data": message.data,
              },
            ),
            NotificationHelper.notificationDetails,
          );
        }
      },
    );
  }

  // try decode data
  static Map<String, dynamic> tryDecode(data) {
    try {
      return jsonDecode(data);
    } catch (e) {
      return {};
    }
  }
}
