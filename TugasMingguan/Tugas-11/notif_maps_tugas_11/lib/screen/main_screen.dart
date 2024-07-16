import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/bottom_nav_cubit.dart';
import '/screen/local_notification_screen.dart';
import '/screen/maps_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tugas 11"),
      ),
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          switch (state.index) {
            case 0:
              return const MapsScreen();
            case 1:
              return const LocalNotificationScreen();
            default:
              return const MapsScreen();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<BottomNavCubit>().state.index,
        onTap: (value) {
          context.read<BottomNavCubit>().navigateTo(index: value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "Notification",
          ),
        ],
        selectedItemColor: Colors.amber,
      ),
    );
  }
}
