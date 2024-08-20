import 'package:flutter/material.dart';
import 'item.dart';

class ReceiptScreen extends StatefulWidget {
  final List<Item> receiveItems;
  final int totalQuantity;
  final double receiveTotalPrice;
  final String receiveNameCustomer;
  final String receivePaymentMethod;
  final String receivePaymnetTotal;
  final String receivePaymentChange;

  const ReceiptScreen({
    super.key,
    required this.receiveItems,
    required this.totalQuantity,
    required this.receiveTotalPrice,
    required this.receiveNameCustomer,
    required this.receivePaymentMethod,
    required this.receivePaymentChange,
    required this.receivePaymnetTotal,
  });

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  final TextEditingController nameCustomerOrder = TextEditingController();
  late String _displayCustomerName;
  late String _displayPaymentMethod;

  @override
  void initState() {
    super.initState();
    _displayCustomerName = widget.receiveNameCustomer;
    _displayPaymentMethod = widget.receivePaymentMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receipt')),
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
                    const Text(
                      "Sariwangi, Parongpong, Bandung Barat",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    const Text("13-08-2024 | 19:44:30"),
                    const SizedBox(height: 20),
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
                    ...widget.receiveItems.map(
                      (item) {
                        final totalPriceForItem = item.price * item.quantity;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("Rp ${item.price}"),
                                      const SizedBox(width: 15),
                                      const Text("x"),
                                      const SizedBox(width: 15),
                                      Text("${item.quantity}"),
                                    ],
                                  ),
                                  Text(
                                    "Rp ${totalPriceForItem.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 3, color: Colors.black),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah Makanan"),
                        Text(
                          widget.totalQuantity.toStringAsFixed(0),
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
                              widget.receiveTotalPrice.toStringAsFixed(0),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Rp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.receivePaymnetTotal,
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
                            Text(
                              widget.receivePaymentChange,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "--- LUNAS ---",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
