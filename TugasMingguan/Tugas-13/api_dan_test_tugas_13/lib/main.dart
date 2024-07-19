import 'package:flutter/material.dart';

import 'product_jewelery_screen.dart';
import 'product_screen.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProductScreen(),
                  ),
                );
              },
              child: const Text("All Product"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProductJeweleryScreen(),
                  ),
                );
              },
              child: const Text("Jewelery Product"),
            ),
            const SizedBox(height: 80),
            const Text(
              "Tugas 13",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("Dibuat oleh M Ibad Guthwara")
          ],
        ),
      ),
    );
  }
}
