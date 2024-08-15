// ignore_for_file: avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/item.dart';
import '../../widgets/time_display_widget.dart';

import '../main_page.dart';
import '/pages/order/order_payment_page.dart';
import '/widgets/date_display_widget.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController nameCustomerOrder = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, Item> _items = {};

  int _totalQuantity = 0;
  int _totalPrice = 0;

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

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 10),
            ElevatedButton.icon(
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





//   final TextEditingController nameCustomerOrder = TextEditingController();
//   int priceItems = 3000;
//   int stockItems = 40;
//   int counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       counter++;
//       if (counter >= stockItems) {
//         counter = stockItems;
//       }
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       counter--;
//       if (counter <= 0) {
//         counter = 0;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final String formattedPriceItems =
//         NumberFormat("#,###", "id_ID").format(priceItems);

//     final int totalPembayaran = priceItems * counter;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Halaman Pesanan"),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: () {
//               showDialog(
//                 barrierDismissible: false,
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: const Text('Confirm'),
//                     content:
//                         const Text('Are you sure to cancel this transaction?'),
//                     actions: <Widget>[
//                       TextButton(
//                         child: const Text(
//                           'Cancel',
//                           style: TextStyle(
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return const MainPage();
//                               },
//                             ),
//                           );
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text('Cancel Transaction, Success.'),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                         ),
//                         child: const Text(
//                           "Yes",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             icon: const Icon(Icons.close),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   DateDisplayWidget(),
//                   TimeDisplayWidget(),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 textCapitalization: TextCapitalization.sentences,
//                 controller: nameCustomerOrder,
//                 keyboardType: TextInputType.name,
//                 decoration: const InputDecoration(
//                   labelText: "Masukkan Nama Pelanggan",
//                   focusedBorder: OutlineInputBorder(),
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person),
//                   isDense: true,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               Chip(
//                 label: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.shopping_basket_outlined),
//                               const SizedBox(width: 5),
//                               Text(
//                                 "$counter",
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.payments_outlined),
//                           const SizedBox(width: 5),
//                           Text(
//                             "Rp $totalPembayaran",
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               const Divider(height: 3, color: Colors.black),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 12, top: 8, bottom: 8, right: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Lemper Ayam",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "Rp $formattedPriceItems",
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: [
//                             const Text("Stock: "),
//                             Text(
//                               "${stockItems - counter}",
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             IconButton(
//                               onPressed: _decrementCounter,
//                               icon: const Icon(Icons.indeterminate_check_box),
//                             ),
//                             Text(
//                               "$counter",
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: _incrementCounter,
//                               icon: const Icon(Icons.add_box),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           "Rp ${priceItems * counter}",
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               const Divider(height: 3, color: Colors.black),
//               const SizedBox(height: 40),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   final sendNameCustomerOrder = nameCustomerOrder.text;
//                   final sendTotalPembayaran = totalPembayaran.toString();
//                   final sendTotalItems = counter.toString();
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return OrderPaymentPage(
//                           receiveNameCustomer: sendNameCustomerOrder,
//                           receivePaymentTotal: sendTotalPembayaran,
//                           receiveTotalItems: sendTotalItems,
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 label: const Text(
//                   "Pilih Jenis Pembayaran",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 icon: const Icon(
//                   Icons.payment,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
