import 'package:flutter/material.dart';

import '../../widgets/date_display_widget.dart';

class ReportDetailSoldPage extends StatelessWidget {
  const ReportDetailSoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Data Penjualan"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Card(
            color: Colors.greenAccent,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Lemper Ayam",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "30",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Divider(height: 3, color: Colors.black),
                  ListTile(
                    title: DateDisplayWidget(),
                    trailing: Text(
                      "10",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(height: 3, color: Colors.black),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text("Kamis, 08 Agustus 2024"),
                    trailing: Text(
                      "15",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(height: 3, color: Colors.black),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text("Selasa, 06 Agustus 2024"),
                    trailing: Text(
                      "5",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(height: 3, color: Colors.black),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
