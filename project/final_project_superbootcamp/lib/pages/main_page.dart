// import '/pages/coba/halaman_percobaan.dart';
import '/pages/auth/login_page.dart';
import '/pages/inventory/inventory_page.dart';
import '/pages/order/order_page.dart';
import '/pages/report/report_page.dart';
import '/widgets/date_display_widget.dart';
import '/widgets/time_display_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Wangisari Kue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login akun: ",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Amy",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Center(child: DateDisplayWidget()),
                const TimeDisplayWidget(),
                const SizedBox(height: 20),
                const Text(
                  "Mulai lanjutkan kegiatan hari ini",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                InkWell(
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text(
                        "Buat Pesanan",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const OrderPage();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.blueAccent,
                          ),
                          child: const Center(
                            child: Text(
                              "Data Makanan",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const InventoryPage();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          child: const Center(
                            child: Text(
                              "Laporan Transaksi",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ReportPage();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const SizedBox(height: 50),
                const Text(
                  "Wangisari Kue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Point of Sell Version 1.0",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                InkWell(
                  child: const Text(
                    "Keluar Aplikasi",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
