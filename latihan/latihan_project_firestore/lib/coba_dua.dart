// ignore_for_file: avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latihan_project_firestore/order_payment_page.dart';

import 'item.dart';
// import 'receipt_screen.dart';

class CobaDua extends StatefulWidget {
  const CobaDua({super.key});

  @override
  State<CobaDua> createState() => _CobaDuaState();
}

class _CobaDuaState extends State<CobaDua> {
  final TextEditingController nameCustomerOrder = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, Item> _items = {};

  int _totalQuantity = 0;
  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchItems();
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
          ),
      };
    });
  }

  void _updateQuantity(String id, int delta) {
    setState(
      () {
        final item = _items[id]!;
        final newQuantity = item.quantity + delta;
        final newStock = item.stock - delta;

        if (newQuantity < 0 || newStock < 0) return;

        item.quantity = newQuantity;
        item.stock = newStock;

        _totalQuantity =
            _items.values.fold(0, (sum, item) => sum + item.quantity);
        _totalPrice = _items.values
            .fold(0, (sum, item) => sum + (item.price * item.quantity));
      },
    );
  }

  void _goToReceiptScreen() {
    // final sendNameCustomerOrder = nameCustomerOrder.text;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ReceiptScreen(
    //       receiveNameCustomer: sendNameCustomerOrder,
    //       receiveItems:
    //           _items.values.where((item) => item.quantity > 0).toList(),
    //       totalQuantity: _totalQuantity,
    //       receiveTotalPrice: _totalPrice,
    //       receivePaymentMethod: '',
    //       receivePaymentChange: 'Rp 0',
    //       receivePaymnetTotal: _totalPrice,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                          "Rp ${_totalPrice.toStringAsFixed(0)}",
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
                                "Rp ${item.price}",
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
                                "Rp ${totalPriceForItem.toStringAsFixed(0)}",
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: _goToReceiptScreen,
                child: const Text('Go to Receipt'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
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
                },
                child: const Text('Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
