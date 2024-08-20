import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/pages/main_page.dart';
import '../../models/report_order_item.dart';
import '../../widgets/date_display_widget.dart';
import '../../widgets/time_display_widget.dart';

import 'pdf_count_page.dart';
import 'pdf_viewer_page.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, ReportOrderItem> _items = {};

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  void _fetchItems() async {
    var snapshot = await _firestore
        .collection('pdfs')
        .orderBy('created_at', descending: true)
        .get();
    setState(() {
      _items = {
        for (var doc in snapshot.docs)
          doc.id: ReportOrderItem(
            id: doc.id,
            // createdAt: (doc['created_at'] as Timestamp).toDate(),
            createdAt: _convertTimestampToDateTime(doc['created_at']),
            // createdAt: doc['created_at'],
            pdfData: doc['pdf_data'],
          ),
      };
    });
  }

  DateTime _convertTimestampToDateTime(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    } else if (timestamp is DateTime) {
      return timestamp;
    } else {
      // Tangani jika tipe data tidak sesuai
      throw Exception('Unexpected type for timestamp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MainPage();
              }));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Laporan Pesanan"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateDisplayWidget(),
                TimeDisplayWidget(),
              ],
            ),
            const SizedBox(height: 10),
            const Chip(
              label: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Pesanan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PdfCountPage(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: _items.values.map(
                  (reportOrderItem) {
                    final formattedDate =
                        DateFormat('EEEE, dd-MM-yyyy | HH:mm:ss', 'id_ID')
                            .format(reportOrderItem.createdAt);
                    return InkWell(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(formattedDate),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfViewerPage(
                              documentId: reportOrderItem.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
