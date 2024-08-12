import '/widgets/date_display_widget.dart';
import 'package:flutter/material.dart';

class ReportIncomePage extends StatefulWidget {
  const ReportIncomePage({super.key});

  @override
  State<ReportIncomePage> createState() => _ReportIncomePageState();
}

class _ReportIncomePageState extends State<ReportIncomePage> {
  String _selectedValue = 'Kalender (A-Z)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Pendapatan"),
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
                  "Total Pendapatan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rp 46.000",
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
                    'Kalender (A-Z)',
                    'Kalender (Z-A)',
                    'Pembayaran (0-9)',
                    'Pembayaran (9-0)',
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
                  dropdownColor: Colors.grey[200],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Card(
              color: Colors.tealAccent,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  title: DateDisplayWidget(),
                  trailing: Text(
                    "Rp 46.000",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
