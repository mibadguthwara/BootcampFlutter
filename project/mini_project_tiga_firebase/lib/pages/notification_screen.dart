import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import '/helper/fcm_helper.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // push local notification
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
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
              const SizedBox(height: 30),

              // push fcm notification
              const Text(
                "Firebase Cloud Message",
                textAlign: TextAlign.center,
              ),
              ValueListenableBuilder(
                valueListenable: NotificationHelper.payload,
                builder: (context, value, child) {
                  final valueJson = FcmHelper.tryDecode(value);
                  return Card(
                    child: ListTile(
                      title: Text("${valueJson['title']}"),
                      subtitle: Text("${valueJson['body']}"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
