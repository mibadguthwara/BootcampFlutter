// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  final _emailLoginController = TextEditingController();
  final _passwordLoginController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailLoginController.text,
        password: _passwordLoginController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Check your email and password or register"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16,
            ),
            child: Column(
              children: [
                const Text(
                  "Wangisari Kue",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailLoginController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordLoginController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.security),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Saya menyetujui menggunakan sistem sesuai peraturan yang berlaku",
                  ),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: isChecked
                      ? () {
                          _login();
                        }
                      : null,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    const SizedBox(width: 5),
                    InkWell(
                      child: const Text(
                        "Register disini",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
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
}
