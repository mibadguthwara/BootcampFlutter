import 'package:flutter/material.dart';

import 'report_detail_sold_page.dart';

class ReportSoldPage extends StatefulWidget {
  const ReportSoldPage({super.key});

  @override
  State<ReportSoldPage> createState() => _ReportSoldPageState();
}

class _ReportSoldPageState extends State<ReportSoldPage> {
  String _selectedValue = 'Alphabet (A-Z)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Penjualan"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Penjualan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "30",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Urutkan list berdasarkan"),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedValue,
                  items: <String>[
                    'Alphabet (A-Z)',
                    'Alphabet (Z-A)',
                    'Sale (0-9)',
                    'Sale (9-0)'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue!;
                    });
                  },
                  dropdownColor:
                      Colors.grey[200], // Warna latar belakang dropdown
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              child: const Card(
                color: Colors.greenAccent,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      "Lemper Ayam",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "30",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ReportDetailSoldPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
