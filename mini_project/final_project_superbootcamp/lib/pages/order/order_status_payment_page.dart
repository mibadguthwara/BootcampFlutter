import '/pages/main_page.dart';
import '/widgets/date_display_widget.dart';
import 'package:flutter/material.dart';

class OrderStatusPaymentPage extends StatefulWidget {
  final String text;
  final String paymentMethodText;
  final String paymentNomimalText;
  const OrderStatusPaymentPage({
    super.key,
    required this.text,
    required this.paymentMethodText,
    required this.paymentNomimalText,
  });

  @override
  State<OrderStatusPaymentPage> createState() => _OrderStatusPaymentPageState();
}

class _OrderStatusPaymentPageState extends State<OrderStatusPaymentPage> {
  late String _displayCustomerName;
  late String _displayPaymentMethod;
  late String _displayPaymentNominal;

  @override
  void initState() {
    super.initState();
    _displayCustomerName = widget.text;
    _displayPaymentMethod = widget.paymentMethodText;
    _displayPaymentNominal = widget.paymentNomimalText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status Pembayaran"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.picture_as_pdf),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MainPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "WANGISARI KUE",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "RP 40.000",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        Text("Berhasil"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const DateDisplayWidget(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nama Pelanggan"),
                        Text(
                          _displayCustomerName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jenis Pembayaran"),
                        Text(
                          _displayPaymentMethod,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(height: 3, color: Colors.black),
                    const ListTile(
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
                    const Divider(height: 3, color: Colors.black),
                    const ListTile(
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
                    const Divider(height: 3, color: Colors.black),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Jumlah Makanan"),
                        Text(
                          "17",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Pembayaran"),
                        Text(
                          "Rp 46.000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah yang dibayarkan"),
                        Text(
                          _displayPaymentNominal,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Kembalian"),
                        Text(
                          "Rp 4.000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Terima kasih telah melakukan pembelian",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Sampai ketemu kembali",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
