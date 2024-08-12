import 'package:final_project_superbootcamp/pages/report/report_detail_order_page.dart';

import '/widgets/date_display_widget.dart';
import 'package:flutter/material.dart';

class ReportOrderPage extends StatelessWidget {
  const ReportOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Pesanan"),
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
                  "Total Pesanan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "1",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              child: const Card(
                color: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: DateDisplayWidget(),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ibad",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text("Rp 40.000 (17)"),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ReportDetailOrderPage();
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
