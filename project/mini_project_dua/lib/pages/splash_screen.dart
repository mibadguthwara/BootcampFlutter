import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  }

  Future<void> delayLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
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
            ],
          ),
        ),
      ),
    );
  }
}
