import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/user/user_bloc.dart';

class FirestorePage extends StatefulWidget {
  const FirestorePage({super.key});

  @override
  State<FirestorePage> createState() => _FirestorePageState();
}

class _FirestorePageState extends State<FirestorePage> {
  final TextEditingController namaController = TextEditingController();

  int selectedUmur = 18;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UsersFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Materi Cloud Firestore"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
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
                      99,
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
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
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
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 16),
                  shrinkWrap: true,
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final data = state.users[index];
                    return Text(
                      "${index + 1}. Umur: ${data['umur']}, Nama: ${data['nama']}",
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
