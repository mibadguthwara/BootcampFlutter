// ignore_for_file: avoid_print

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages

class FileListWidget extends StatefulWidget {
  const FileListWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FileListWidgetState createState() => _FileListWidgetState();
}

class _FileListWidgetState extends State<FileListWidget> {
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

  Future<void> _deleteFile(String fileName) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('uploads/$fileName');

      await ref.delete();
      print('File $fileName deleted successfully');
    } catch (e) {
      print('Failed to delete file: $e');
    }
  }

  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        print("Tidak dapat mengakses $url");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  Future<String> _getDownloadURL(String fileName) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('uploads/$fileName');
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Failed to get download URL: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _fileNames.length,
      itemBuilder: (context, index) {
        String fileName = _fileNames[index];
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Card(
            child: ListTile(
              title: Text(fileName),
              subtitle: FutureBuilder<String>(
                future: _getDownloadURL(fileName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Fetching URL...');
                  } else if (snapshot.hasError) {
                    return const Text('Error fetching URL');
                  } else if (snapshot.hasData) {
                    return InkWell(
                      onTap: () => _launchURL(snapshot.data!),
                      child: const Text(
                        'Link Download',
                        style: TextStyle(color: Colors.blue),
                      ),
                    );
                  } else {
                    return const Text('No URL available');
                  }
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await _deleteFile(fileName);
                  _listFiles();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
