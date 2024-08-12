import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import '/pages/auth/login_page.dart';
import 'main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    delayLogin();
  }

  Future<void> _checkLoginStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is signed in
      // Navigate to your home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ), // Ganti dengan home page-mu
      );
    } else {
      // User is not signed in
      // Navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ), // Ganti dengan login screen-mu
      );
    }
  }

  Future<void> delayLogin() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ), // Ganti dengan login screen-mu
        );
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
              // Image.asset(
              //   "assets/images/icon_logo_square.png",
              //   height: 150,
              // ),
              const Text(
                "Wangisari Kue",
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 20),
              Lottie.asset(
                'assets/animations/loading_animation.json',
                fit: BoxFit.cover,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
