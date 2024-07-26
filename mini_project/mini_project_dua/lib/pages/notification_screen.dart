import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import '../helper/notification_helper.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        automaticallyImplyLeading: true,
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
                  "Local Notification Payload:\n${NotificationHelper.payload.value}\n",
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
                  "SWG App",
                  "Menampilkan notifikasi dari aplikasi SWG untuk pengguna mobile",
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
