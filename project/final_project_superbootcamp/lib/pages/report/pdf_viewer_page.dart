// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatefulWidget {
  final String documentId;

  const PdfViewerPage({super.key, required this.documentId});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late Future<Uint8List> _pdfDataFuture;

  @override
  void initState() {
    super.initState();
    _pdfDataFuture = _fetchPdfData();
  }

  Future<Uint8List> _fetchPdfData() async {
    // Mengambil dokumen dari Firestore
    final doc = await FirebaseFirestore.instance
        .collection('pdfs')
        .doc(widget.documentId)
        .get();

    if (doc.exists) {
      // Mengambil data PDF (Base64) dari dokumen
      final base64Pdf = doc['pdf_data'] as String;
      // Mengonversi Base64 menjadi bytes
      return base64Decode(base64Pdf);
    } else {
      throw Exception('Dokumen tidak ditemukan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Struk Pembayaran (pdf)'),
      ),
      body: FutureBuilder<Uint8List>(
        future: _pdfDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final pdfData = snapshot.data!;
            return PdfView(
              controller: PdfController(
                document: PdfDocument.openData(pdfData),
              ),
            );
          } else {
            return const Center(child: Text('Tidak ada data PDF'));
          }
        },
      ),
    );
  }
}
