import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_notification_pengayaan/notification_helper.dart';

void main() async {
  // menambahkan [ensureInitialized] agar fungsi dibawahnya dijalankan saat flutter app benar2 terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // inisialisasi local notification
  await NotificationHelper().initLocalNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Local Notification",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
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
                    "Local Notification Payload:\n\n${NotificationHelper.payload.value}\n",
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
                    "Judul Local Notification",
                    "Percobaan untuk menampilkan Local Notifications",
                    payload: jsonEncode({"data": "test"}),
                    NotificationHelper.notificationDetails,
                  );
                },
                child: const Text("Kirim Notifikasi"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
