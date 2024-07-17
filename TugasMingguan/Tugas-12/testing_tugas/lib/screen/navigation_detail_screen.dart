import 'package:flutter/material.dart';

class NavigationDetailScreen extends StatelessWidget {
  const NavigationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Kedua"),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Anda saat ini berada di Halaman Kedua"),
      ),
    );
  }
}
