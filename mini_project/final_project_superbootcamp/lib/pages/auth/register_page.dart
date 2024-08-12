import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/pages/auth/login_page.dart';
import '../../logic/auth/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "REGISTER",
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
                  controller: emailController,
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
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.security),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Nama",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Nomor Handphone",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone_android_rounded),
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
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: state.isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: isChecked
                                  ? () {
                                      if (emailController.text.isEmpty ||
                                          passController.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Username dan/atau Password Harus diisi"),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      } else if (emailController
                                              .text.isNotEmpty &&
                                          passController.text.isNotEmpty) {
                                        context.read<AuthBloc>().add(
                                              AuthRegister(
                                                email: emailController.text,
                                                password: passController.text,
                                              ),
                                            );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Registrasi Berhasil"),
                                          ),
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage(),
                                          ),
                                        );
                                      }
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    );
                  },
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun?"),
                    const SizedBox(width: 5),
                    InkWell(
                      child: const Text(
                        "Login disini",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
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
