import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/auth/auth_bloc.dart';
import '../logic/user/user_bloc.dart';
import '/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController namaController = TextEditingController();

  int selectedUmur = 1;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UsersFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content:
                        const Text('Apakah kamu yakin akan keluar dari akun?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state.errorMessage.isNotEmpty
                      ? Text("Error : ${state.errorMessage}")
                      : Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.email),
                              title: const Text("Email"),
                              subtitle: Text("${state.userData?.email}"),
                            ),
                            ListTile(
                              leading: const Icon(Icons.security),
                              title: const Text("UID"),
                              subtitle: Text("${state.userData?.uid}"),
                            ),
                          ],
                        );
                },
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              labelText: "Nama",
                            ),
                            controller: namaController,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField(
                          value: selectedUmur,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: List.generate(
                            70,
                            (index) => DropdownMenuItem(
                              value: index + 1,
                              child: Text("${index + 1}"),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedUmur = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(
                              UsersAdded(
                                nama: namaController.text,
                                umur: selectedUmur,
                              ),
                            );
                      },
                      child: const Text("Kirim ke Firestore"),
                    ),
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.users.length,
                          itemBuilder: (context, index) {
                            final data = state.users[index];
                            return Text(
                              "${index + 1}. ${data['nama']} (${data['umur']} Tahun)",
                            );
                          },
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
    );
  }
}
