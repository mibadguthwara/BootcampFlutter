// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadButtonWidget extends StatefulWidget {
  const UploadButtonWidget({super.key});

  @override
  _UploadButtonWidgetState createState() => _UploadButtonWidgetState();
}

class _UploadButtonWidgetState extends State<UploadButtonWidget> {
  UploadTask? uploadTask;
  // ignore: unused_field
  List<String> _fileNames = [];

  @override
  void initState() {
    super.initState();
    _listFiles();
  }

  Future<void> _listFiles() async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('uploads');

      final ListResult result = await ref.listAll();
      final fileNames = result.items.map((e) => e.name).toList();

      setState(() {
        _fileNames = fileNames;
      });
    } catch (e) {
      print('Failed to list files: $e');
    }
  }

  Future<void> _pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      File fileToUpload = File(file.path!);

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('uploads/${file.name}');

      setState(() {
        uploadTask = ref.putFile(fileToUpload);
      });

      uploadTask!.snapshotEvents.listen((TaskSnapshot snapshot) {
        print('Upload ${snapshot.bytesTransferred}/${snapshot.totalBytes}');
      });

      try {
        await uploadTask!.whenComplete(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("File Berhasil diupload"),
              duration: Duration(seconds: 2),
            ),
          );
          _listFiles();
        });
        print('File Uploaded');
      } catch (e) {
        print('Failed to upload file: $e');
      }
    } else {
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.upload_file_rounded),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: _pickAndUploadFile,
      label: const Text('Upload Document'),
    );
  }
}
