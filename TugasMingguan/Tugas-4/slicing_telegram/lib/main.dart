import 'package:flutter/material.dart';
import 'package:slicing_telegram/call_screen.dart';
import 'package:slicing_telegram/contact_screen.dart';
import 'package:slicing_telegram/chat_screen.dart';
import 'package:slicing_telegram/home_page.dart';
import 'package:slicing_telegram/setting_screen.dart';

void main() {
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
        home: ChatScreen(),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (_) => const HomePage(),
          ChatScreen.routeName: (_) => ChatScreen(),
          ContactScreen.routeName: (_) => ContactScreen(),
          CallScreen.routeName: (_) => const CallScreen(),
          SettingScreen.routeName: (_) => const SettingScreen(),
        });
  }
}
