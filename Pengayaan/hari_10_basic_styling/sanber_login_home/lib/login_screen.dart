import 'package:flutter/material.dart';
import 'package:sanber_login_home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            child: Column(
              children: [
                const Text(
                  "Sanber Flutter",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                  // Color.fromARGB(1, 84, 197, 248)
                ),
                Image.asset(
                  "assets/images/flutter.png",
                  height: 100,
                ),
                const SizedBox(height: 25),
                const TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Username",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
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
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(fontSize: 14),
                    )),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Does not have account?"),
                    const SizedBox(width: 10),
                    TextButton(onPressed: () {}, child: const Text("Sign in")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
