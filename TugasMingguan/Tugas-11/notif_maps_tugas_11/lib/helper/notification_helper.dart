import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  // flutter local notification plugin
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // notification payload
  static ValueNotifier<String> payload = ValueNotifier("");

  // set the payload
  void setPayload(String newPayload) {
    payload.value = newPayload;
  }

  // inisialisasikan settingan channel notifikasi untuk android
  static AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails(
    "Local Notif",
    "Sanber Local Notif",
    channelDescription: "Untuk percobaan Local Notif",
    importance: Importance.max,
    priority: Priority.high,
    icon: "@mipmap/ic_launcher",
    playSound: true,
    enableVibration: true,
  );

  // inisialisasikan settingan channel notifikasi untuk iOS/MacOS
  static DarwinNotificationDetails iOSNotificationDetails =
      const DarwinNotificationDetails(
    threadIdentifier: "local_notif",
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  // Notifications Details untuk multi-platform
  static NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    iOS: iOSNotificationDetails,
  );

  // inistialisasi flutter_local_notifications
  Future<void> initLocalNotifications() async {
    // config for android
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // config for iOS & MacOS
    const initializationSettingsIOS = DarwinInitializationSettings();

    // initializations
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // inisialisasikan konfigurasi dari local notification
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // handle ketika notifikasi ditekan
        debugPrint("Notifikasi ditekan ${details.payload}");
        setPayload(details.payload ?? "");
      },
    );

    // request permission untuk android 14 ke atas
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    // request permission untuk iOS
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
}
