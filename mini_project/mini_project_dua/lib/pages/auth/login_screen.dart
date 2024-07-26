import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project_dua/pages/product/product_screen.dart';
import 'package:mini_project_dua/pages/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameLoginController = TextEditingController();
  final _passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icon_logo_square.png",
                  height: 180,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _usernameLoginController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: _passwordLoginController,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 13,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "lupa password",
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String usernameValueForm = "mibadguthwara";
                    String passwordValueForm = "superbootcamp";
                    if (_usernameLoginController.text.isEmpty &&
                        _passwordLoginController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Username & Password belum diisi (❗)"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (_usernameLoginController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Username belum diisi (❗)"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (_passwordLoginController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Password belum diisi (❗)"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (_usernameLoginController.text ==
                                usernameValueForm &&
                            _passwordLoginController.text !=
                                passwordValueForm ||
                        _passwordLoginController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              // Text("Username (benar ✔) | Password (salah ✘)"),
                              Text("Username dan password tidak sesuai"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (_usernameLoginController.text !=
                            usernameValueForm &&
                        _passwordLoginController.text == passwordValueForm) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Username dan password tidak sesuai"),
                          // Text("Username (salah ✘) | Password (benar ✔)"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (_usernameLoginController.text !=
                            usernameValueForm &&
                        _passwordLoginController.text != passwordValueForm) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Username dan assword tidak sesuai"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (_usernameLoginController.text ==
                            usernameValueForm &&
                        _passwordLoginController.text == passwordValueForm) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Welcome $usernameValueForm"),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    const SizedBox(width: 5),
                    InkWell(
                      child: const Text(
                        "Daftar disini",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
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
