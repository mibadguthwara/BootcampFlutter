import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_project_tiga_firebase/pages/product/product_screen.dart';

import '/pages/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayLogin();
    // _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is signed in
      // Navigate to your home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductScreen(),
        ), // Ganti dengan home page-mu
      );
    } else {
      // User is not signed in
      // Navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ), // Ganti dengan login screen-mu
      );
    }
  }

  Future<void> delayLogin() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const LoginScreen(),
        //   ),
        // );
        _checkLoginStatus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/icon_logo_square.png",
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                "Memuat data . . .",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // const CircularProgressIndicator(),
              Lottie.asset(
                'assets/animation/loading_animation.json',
                fit: BoxFit.cover,
                height: 80,
              ),
              const SizedBox(height: 80),
              const Text(
                "App Version 3.0",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
