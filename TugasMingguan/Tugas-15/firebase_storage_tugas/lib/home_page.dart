import 'package:flutter/material.dart';

import 'file_list_widget.dart';
import 'upload_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 15'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Expanded(
            child: FileListWidget(),
          ),
          Center(
            child: UploadButtonWidget(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
