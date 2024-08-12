import '/pages/main_page.dart';
import '/widgets/date_display_widget.dart';
import 'package:flutter/material.dart';

class OrderStatusPaymentPage extends StatefulWidget {
  final String receiveNameCustomer;
  final String receivePaymentMethodText;
  final String receivePaymentNomimalText;
  final String receivePaymentChangeText;
  final String receivePaymentTotal;
  final String receiveTotalItems;

  const OrderStatusPaymentPage({
    super.key,
    required this.receiveNameCustomer,
    required this.receivePaymentMethodText,
    required this.receivePaymentNomimalText,
    required this.receivePaymentChangeText,
    required this.receiveTotalItems,
    required this.receivePaymentTotal,
  });

  @override
  State<OrderStatusPaymentPage> createState() => _OrderStatusPaymentPageState();
}

class _OrderStatusPaymentPageState extends State<OrderStatusPaymentPage> {
  late String _displayCustomerName;
  late String _displayPaymentMethod;
  late String _displayPaymentNominal;
  late String _displayPaymentChange;
  late String _displayPaymentTotal;
  late String _displayTotalItems;

  @override
  void initState() {
    super.initState();
    _displayCustomerName = widget.receiveNameCustomer;
    _displayPaymentMethod = widget.receivePaymentMethodText;
    _displayPaymentNominal = widget.receivePaymentNomimalText;
    _displayPaymentChange = widget.receivePaymentChangeText;
    _displayPaymentTotal = widget.receivePaymentTotal;
    _displayTotalItems = widget.receiveTotalItems;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Rp",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          _displayPaymentTotal,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah Makanan"),
                        Text(
                          _displayTotalItems,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Pembayaran"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Rp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _displayPaymentTotal,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah yang dibayarkan"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Rp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _displayPaymentNominal,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Kembalian"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Rp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _displayPaymentChange,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
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
