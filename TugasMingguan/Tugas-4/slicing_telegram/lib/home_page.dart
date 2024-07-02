import 'package:flutter/material.dart';
import 'package:slicing_telegram/chat_screen.dart';
import 'package:slicing_telegram/contact_screen.dart';

import 'call_screen.dart';
import 'setting_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      label: 'Contact',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.call_outlined),
      label: 'Call',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message_outlined),
      label: 'Chats',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  final List<Widget> _listWidget = [
    ContactScreen(),
    const CallScreen(),
    ChatScreen(),
    const SettingScreen(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
