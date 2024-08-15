// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PdfCountPage extends StatefulWidget {
  const PdfCountPage({super.key});

  @override
  _PdfCountPageState createState() => _PdfCountPageState();
}

class _PdfCountPageState extends State<PdfCountPage> {
  Future<int> _getPdfCount() async {
    // Mengakses koleksi 'pdfs' dan menghitung jumlah dokumen
    final querySnapshot =
        await FirebaseFirestore.instance.collection('pdfs').get();
    return querySnapshot.size; // Mengembalikan jumlah dokumen dalam koleksi
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _getPdfCount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final count = snapshot.data!;
          return Text('$count',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
        } else {
          return const Text('Tidak ada dokumen');
        }
      },
    );
  }
}
