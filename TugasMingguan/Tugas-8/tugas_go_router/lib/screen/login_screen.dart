import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../go_router.dart';
// import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Sanber Flutter",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                  // Color.fromARGB(1, 84, 197, 248)
                ),
                Image.asset(
                  "assets/images/flutter.png",
                  height: 100,
                ),
                const SizedBox(height: 25),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "Username",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  controller: _textController,
                ),
                const SizedBox(height: 18),
                const TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password",
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // pakai .push agar tetap bisa kembali ke halaman login setelah pindah ke halaman home
                    context.push(
                      RouterPage.homeRoute,
                      extra: _textController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Does not have account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sign in"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
