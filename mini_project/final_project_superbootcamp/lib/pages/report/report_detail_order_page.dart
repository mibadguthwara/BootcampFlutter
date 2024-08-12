import 'package:flutter/material.dart';

import '../../widgets/date_display_widget.dart';

class ReportDetailOrderPage extends StatelessWidget {
  const ReportDetailOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Data Pesanan"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Card(
            color: Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Ibad",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  DateDisplayWidget(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jenis Pembayaran"),
                      Text(
                        "Tunai (Cash)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Makanan"),
                      Text(
                        "17",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Pembayaran"),
                      Text(
                        "Rp 46.000",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jumlah yang dibayarkan"),
                      Text(
                        "Rp 50.000",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kembali"),
                      Text(
                        "Rp 4.000",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(height: 3, color: Colors.black),
                  ListTile(
                    title: Text(
                      "Lemper Ayam",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Rp 3.000"),
                            SizedBox(width: 10),
                            Text(" x "),
                            SizedBox(width: 10),
                            Text(
                              "12",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "Rp 36.000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 3, color: Colors.black),
                  ListTile(
                    title: Text(
                      "Risol Mayones",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Rp 2.000"),
                            SizedBox(width: 10),
                            Text(" x "),
                            SizedBox(width: 10),
                            Text(
                              "5",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "Rp 10.000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
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
