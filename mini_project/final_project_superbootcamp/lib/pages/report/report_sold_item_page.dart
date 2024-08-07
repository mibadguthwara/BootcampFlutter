import 'package:flutter/material.dart';

class ReportSoldItemPage extends StatefulWidget {
  const ReportSoldItemPage({super.key});

  @override
  State<ReportSoldItemPage> createState() => _ReportSoldItemPageState();
}

class _ReportSoldItemPageState extends State<ReportSoldItemPage> {
  String _selectedValue = 'Alphabet (A-Z)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sold Item Report"),
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
                  "Total Sold Items",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "85",
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
            const Card(
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
            const Card(
              child: ListTile(
                title: Text(
                  "Nagasari",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  "8",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
