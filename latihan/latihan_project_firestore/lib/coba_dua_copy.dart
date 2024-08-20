// // ignore_for_file: avoid_types_as_parameter_names

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// // import 'package:latihan_project_firestore/order_payment_page.dart';

// import 'item.dart';
// import 'receipt_screen.dart';

// class CobaDua extends StatefulWidget {
//   const CobaDua({super.key});

//   @override
//   State<CobaDua> createState() => _CobaDuaState();
// }

// class _CobaDuaState extends State<CobaDua> {
//   final TextEditingController nameCustomerOrder = TextEditingController();
//   final TextEditingController inputPaymentNominal = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Map<String, Item> _items = {};
//   String _selectedValue = 'option1';
//   // int _changePayment = 0;
//   int _totalQuantity = 0;
//   double _totalPrice = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _fetchItems();
//   }

//   void _fetchItems() async {
//     var snapshot = await _firestore.collection('items').get();
//     setState(() {
//       _items = {
//         for (var doc in snapshot.docs)
//           doc.id: Item(
//             id: doc.id,
//             name: doc['name'],
//             price: doc['price'],
//             stock: doc['stock'],
//           ),
//       };
//     });
//   }

//   void _updateQuantity(String id, int delta) {
//     // final String text = inputPaymentNominal.text;
//     // final int nominal = int.tryParse(text) ?? 0;
//     setState(
//       () {
//         final item = _items[id]!;
//         final newQuantity = item.quantity + delta;
//         final newStock = item.stock - delta;

//         if (newQuantity < 0 || newStock < 0) return;

//         item.quantity = newQuantity;
//         item.stock = newStock;

//         _totalQuantity =
//             _items.values.fold(0, (sum, item) => sum + item.quantity);
//         _totalPrice = _items.values
//             .fold(0, (sum, item) => sum + (item.price * item.quantity));

//         // _changePayment = nominal - _totalPrice.toStringAsFixed(0);
//       },
//     );
//   }

//   void _goToReceiptScreen() {
//     final sendNameCustomerOrder = nameCustomerOrder.text;
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ReceiptScreen(
//           receiveNameCustomer: sendNameCustomerOrder,
//           receiveItems:
//               _items.values.where((item) => item.quantity > 0).toList(),
//           totalQuantity: _totalQuantity,
//           receiveTotalPrice: _totalPrice,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Item List')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(height: 15),
//             TextFormField(
//               textCapitalization: TextCapitalization.sentences,
//               controller: nameCustomerOrder,
//               keyboardType: TextInputType.name,
//               decoration: const InputDecoration(
//                 labelText: "Masukkan Nama Pelanggan",
//                 focusedBorder: OutlineInputBorder(),
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.person),
//                 isDense: true,
//               ),
//             ),
//             const SizedBox(height: 15),
//             Chip(
//               label: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(Icons.shopping_basket_outlined),
//                             const SizedBox(width: 5),
//                             Text(
//                               "$_totalQuantity",
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         const Icon(Icons.payments_outlined),
//                         const SizedBox(width: 5),
//                         Text(
//                           "Rp ${_totalPrice.toStringAsFixed(0)}",
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             const Divider(height: 3, color: Colors.black),
//             Expanded(
//               child: ListView(
//                 children: _items.values.map(
//                   (item) {
//                     final totalPriceForItem = item.price * item.quantity;
//                     return Padding(
//                       padding: const EdgeInsets.only(
//                         left: 12,
//                         top: 8,
//                         bottom: 8,
//                         right: 8,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 item.name,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "Rp ${item.price}",
//                                 style: const TextStyle(fontSize: 14),
//                               ),
//                               const SizedBox(height: 5),
//                               Text("Stock: ${item.stock}"),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () =>
//                                         _updateQuantity(item.id, -1),
//                                     icon: const Icon(
//                                         Icons.indeterminate_check_box),
//                                   ),
//                                   Text(
//                                     '${item.quantity}',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: () =>
//                                         _updateQuantity(item.id, 1),
//                                     icon: const Icon(Icons.add_box),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 "Rp ${totalPriceForItem.toStringAsFixed(0)}",
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ).toList(),
//               ),
//             ),
//             const SizedBox(height: 15),
//             RadioListTile<String>(
//               title: Text(
//                 'Tunai (Cash)',
//                 style: TextStyle(
//                   fontWeight: _selectedValue == 'option1'
//                       ? FontWeight.bold
//                       : FontWeight.normal,
//                 ),
//               ),
//               selected: true,
//               value: 'option1',
//               groupValue: _selectedValue,
//               onChanged: (String? value) {
//                 setState(() {
//                   _selectedValue = value!;
//                 });
//               },
//             ),
//             RadioListTile<String>(
//               title: Text(
//                 'QRIS (Cashless)',
//                 style: TextStyle(
//                   fontWeight: _selectedValue == 'option2'
//                       ? FontWeight.bold
//                       : FontWeight.normal,
//                 ),
//               ),
//               value: 'option2',
//               groupValue: _selectedValue,
//               onChanged: (String? value) {
//                 setState(() {
//                   _selectedValue = value!;
//                 });
//               },
//             ),
//             const SizedBox(height: 15),
//             _selectedValue == 'option1'
//                 ? _buildCashPayment()
//                 : _buildCashlessPayment(),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ElevatedButton(
//                 onPressed: _goToReceiptScreen,
//                 child: const Text('Go to Receipt'),
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(10.0),
//             //   child: ElevatedButton(
//             //     onPressed: () {
//             //       final sendNameCustomerOrder = nameCustomerOrder.text;
//             //       Navigator.push(
//             //         context,
//             //         MaterialPageRoute(
//             //           builder: (context) {
//             //             return OrderPaymentPage(
//             //               receiveNameCustomer: sendNameCustomerOrder,
//             //               receivePaymentTotal: "",
//             //               receiveTotalItems: "",
//             //               totalPrice: _totalPrice,
//             //               totalQuantity: _totalQuantity,
//             //             );
//             //           },
//             //         ),
//             //       );
//             //     },
//             //     child: const Text('Payment'),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCashPayment() {
//     return Column(
//       children: [
//         Row(
//           children: [
//             const Expanded(
//               flex: 0,
//               child: Text(
//                 "Jumlah yang dibayarkan",
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               flex: 1,
//               child: TextFormField(
//                 controller: inputPaymentNominal,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: "Nominal (Rp)",
//                   focusedBorder: OutlineInputBorder(),
//                   border: OutlineInputBorder(),
//                   // prefixIcon: Icon(Icons.monetization_on_sharp),

//                   isDense: true,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 15),
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Kembalian:",
//               style: TextStyle(fontSize: 16),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Rp"),
//                 SizedBox(width: 10),
//                 Padding(
//                   padding: EdgeInsets.only(right: 24.0),
//                   child: Text(
//                     // "$_changePayment",
//                     "",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 40),
//         ElevatedButton.icon(
//           onPressed: () {
//             // final sendPaymentNominalData = inputPaymentNominal.text;
//             // Navigator.pushReplacement(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) {
//             //       return OrderStatusPaymentPage(
//             //         receiveNameCustomer: _displayCustomerName,
//             //         receivePaymentMethodText: "Tunai (Cash)",
//             //         receivePaymentNomimalText: sendPaymentNominalData,
//             //         receivePaymentChangeText: _changePayment.toString(),
//             //         receiveTotalItems: _displayTotalItems,
//             //         receivePaymentTotal: _displayPaymentTotal,
//             //       );
//             //     },
//             //   ),
//             // );
//           },
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//           label: const Text(
//             "Konfirmasi Pembayaran Tunai (Cash)",
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: const Icon(
//             Icons.payments_outlined,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCashlessPayment() {
//     return Column(
//       children: [
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Merchant",
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               "Wangisari Kue",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         const SizedBox(height: 15),
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "NMID",
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               "ID1989000008900",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         const SizedBox(height: 15),
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Status",
//               style: TextStyle(fontSize: 16),
//             ),

//             /// clip loading
//             // Chip(
//             //   avatar: Icon(Icons.update),
//             //   label: Text("Waiting for information"),
//             //   backgroundColor: Colors.yellow,
//             // ),

//             // / clip success
//             Chip(
//               avatar: Icon(
//                 Icons.done,
//                 color: Colors.white,
//               ),
//               label: Text("Payment Success"),
//               labelStyle: TextStyle(color: Colors.white),
//               backgroundColor: Colors.green,
//             ),
//           ],
//         ),
//         const SizedBox(height: 40),
//         ElevatedButton.icon(
//           onPressed: () {
//             // final sendNameCustomerOrder = nameCustomerOrder.text;
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => ReceiptScreen(
//             //       receiveNameCustomer: sendNameCustomerOrder,
//             //       receiveItems:
//             //           _items.values.where((item) => item.quantity > 0).toList(),
//             //       totalQuantity: _totalQuantity,
//             //       totalPrice: _totalPrice,
//             //     ),
//             //   ),
//             // );
//             // final sendNameCustomerOrder = nameCustomerOrder.text;
//             // Navigator.pushReplacement(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) {
//             //       return ReceiptScreen(
//             //               receiveNameCustomer: sendNameCustomerOrder,
//             //       receiveItems:
//             //           _items.values.where((item) => item.quantity > 0).toList(),
//             //       totalQuantity: _totalQuantity,
//             //       totalPrice: _totalPrice, receiveTotalPrice: null,
//             //       );
//             //     },
//             //   ),
//             // );
//           },
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//           label: const Text(
//             "Konfirmasi Pembayaran QRIS (Cashless)",
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: const Icon(
//             Icons.qr_code_2,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }
