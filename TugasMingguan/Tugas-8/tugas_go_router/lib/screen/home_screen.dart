import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../go_router.dart';

class HomeScreen extends StatelessWidget {
  final String extra;
  const HomeScreen({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Welcome,",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  extra,
                  style: const TextStyle(fontSize: 38),
                ),
                const SizedBox(height: 50),
                Center(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.push(RouterPage.listViewRoute);
                    },
                    child: const Text("Lihat halaman ListView"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
