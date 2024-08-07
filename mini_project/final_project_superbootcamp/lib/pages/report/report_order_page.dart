import 'package:final_project_superbootcamp/pages/report/report_detail_order_page.dart';

import '/widgets/date_display_widget.dart';
import 'package:flutter/material.dart';

class ReportOrderPage extends StatelessWidget {
  const ReportOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Data Report"),
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
                  "Total Orders",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "6",
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
                color: Colors.amber,
                child: ListTile(
                  title: DateDisplayWidget(),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("#10124080081"),
                      Text("Rp 40.000 (17)"),
                    ],
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
            const SizedBox(height: 10),
            const Card(
              color: Colors.amber,
              child: ListTile(
                title: DateDisplayWidget(),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("#10124080081"),
                    Text("Rp 40.000 (17)"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              color: Colors.amber,
              child: ListTile(
                title: DateDisplayWidget(),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("#10124080081"),
                    Text("Rp 40.000 (17)"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
