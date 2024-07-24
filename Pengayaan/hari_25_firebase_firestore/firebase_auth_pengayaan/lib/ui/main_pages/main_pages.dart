import 'package:firebase_auth_pengayaan/ui/storage_pages/image_storage_page.dart';

import '/ui/auth_pages/sign_in_pages.dart';
import '/ui/firestore_pages/firestore_page.dart';
import 'package:flutter/material.dart';

class MainPages extends StatelessWidget {
  const MainPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Materi Firebase"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPages(),
                    ),
                  );
                },
                child: const Text("Auth Page"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirestorePage(),
                    ),
                  );
                },
                child: const Text("Firestore Page"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImageStoragePage(),
                    ),
                  );
                },
                child: const Text("Storage Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
