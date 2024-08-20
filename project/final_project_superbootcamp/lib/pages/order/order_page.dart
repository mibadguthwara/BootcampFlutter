// ignore_for_file: avoid_types_as_parameter_names
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../models/item.dart';
import '../main_page.dart';
import '/widgets/time_display_widget.dart';
import '/widgets/date_display_widget.dart';
import 'order_payment_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController nameCustomerOrder = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, Item> _items = {}; // Map to store item data
  Map<String, int> _initialStock = {}; // Map to store initial stock values

  int _totalQuantity = 0;
  int _totalPrice = 0;

  bool _isButtonEnabled = false;

  void _updateButtonState() {
    final isTextFieldEmpty = nameCustomerOrder.text.trim().isEmpty;

    setState(() {
      _isButtonEnabled = !isTextFieldEmpty;
    });
  }

  @override
  void dispose() {
    nameCustomerOrder.removeListener(_updateButtonState);
    nameCustomerOrder.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchItems();
    nameCustomerOrder.addListener(_updateButtonState);
  }

  void _fetchItems() async {
    var snapshot = await _firestore.collection('items').get();
    setState(() {
      _items = {
        for (var doc in snapshot.docs)
          doc.id: Item(
            id: doc.id,
            name: doc['name'],
            price: doc['price'],
            stock: doc['stock'],
            imageUrl: doc['image_url'],
            description: doc['description'],
            quantity: 0,
          ),
      };
      _initialStock = {
        for (var doc in snapshot.docs) doc.id: doc['stock'],
      };
    });
  }

  Future<void> _updateQuantity(String id, int delta) async {
    final item = _items[id]!;

    final newQuantity = item.quantity + delta;
    final newStock = item.stock - delta;

    if (newQuantity < 0 || newStock < 0) return;

    // Update item di Firestore
    await _firestore.collection('items').doc(id).update({
      'stock': newStock,
    });

    setState(
      () {
        item.quantity = newQuantity;
        item.stock = newStock;

        _totalQuantity =
            _items.values.fold(0, (sum, item) => sum + item.quantity);
        _totalPrice = _items.values
            .fold(0, (sum, item) => sum + (item.price * item.quantity));
      },
    );
  }

  Future<void> _resetOrder() async {
    // Update Firestore to restore initial stock values
    for (var id in _items.keys) {
      await _firestore.collection('items').doc(id).update({
        'stock': _initialStock[id],
      });
    }
    // Reset item di UI
    setState(() {
      for (var item in _items.values) {
        item.quantity = 0; // Reset quantity
        item.stock = _initialStock[item.id]!; // Restore initial stock
      }
      _totalQuantity = 0;
      _totalPrice = 0;
      nameCustomerOrder.clear(); // Hapus nama pelanggan
    });
  }

  @override
  Widget build(BuildContext context) {
    // Buat instance NumberFormat dengan format mata uang IDR
    final currencyFormatter = NumberFormat.currency(
        locale: 'id_ID', name: 'IDR', decimalDigits: 0, symbol: 'Rp ');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Pesanan"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm'),
                    content:
                        const Text('Are you sure to cancel this transaction?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _resetOrder();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const MainPage();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cancel Transaction, Success.'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateDisplayWidget(),
                TimeDisplayWidget(),
              ],
            ),
            const SizedBox(height: 15),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: nameCustomerOrder,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Masukkan Nama Pelanggan",
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                isDense: true,
              ),
            ),
            const SizedBox(height: 15),
            Chip(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.shopping_basket_outlined),
                            const SizedBox(width: 5),
                            Text(
                              "$_totalQuantity",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.payments_outlined),
                        const SizedBox(width: 5),
                        Text(
                          currencyFormatter.format(_totalPrice),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Divider(height: 3, color: Colors.black),
            Expanded(
              child: ListView(
                children: _items.values.map(
                  (item) {
                    final totalPriceForItem = item.price * item.quantity;
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 8,
                        bottom: 8,
                        right: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                currencyFormatter.format(item.price),
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 5),
                              Text("Stock: ${item.stock}"),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        _updateQuantity(item.id, -1),
                                    icon: const Icon(
                                        Icons.indeterminate_check_box),
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        _updateQuantity(item.id, 1),
                                    icon: const Icon(Icons.add_box),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                currencyFormatter.format(totalPriceForItem),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _isButtonEnabled
                  ? () {
                      final sendNameCustomerOrder = nameCustomerOrder.text;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrderPaymentPage(
                              receiveNameCustomer: sendNameCustomerOrder,
                              totalQuantity: _totalQuantity,
                              totalPrice: _totalPrice,
                              receiveItems: _items.values
                                  .where((item) => item.quantity > 0)
                                  .toList(),
                            );
                          },
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              label: const Text(
                "Pilih Jenis Pembayaran",
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.payment,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
