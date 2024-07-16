import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import '../helper/notification_helper.dart';

class LocalNotificationScreen extends StatelessWidget {
  const LocalNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // push notification
            ListenableBuilder(
              listenable: NotificationHelper.payload,
              builder: (context, child) {
                return Text(
                  "Local Notification Payload:\n${NotificationHelper.payload.value}",
                  textAlign: TextAlign.center,
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                // reset payload value
                NotificationHelper.payload.value = "";

                // kirim notification
                await NotificationHelper.flutterLocalNotificationsPlugin.show(
                  Random().nextInt(99),
                  "Halaman Notifikasi",
                  "Menampilkan notifikasi lokal dari menekan tombol kirim notifikasi didalam aplikasi",
                  payload: jsonEncode({"data": "test"}),
                  NotificationHelper.notificationDetails,
                );
              },
              child: const Text("Kirim Notifikasi"),
            ),
          ],
        ),
      ),
    );
  }
}
