// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../../models/item.dart';

// class HalamanPercobaan extends StatefulWidget {
//   const HalamanPercobaan({super.key});

//   @override
//   State<HalamanPercobaan> createState() => _HalamanPercobaanState();
// }

// class _HalamanPercobaanState extends State<HalamanPercobaan> {
// //   List<Item> items = List.generate(
// //     5,
// //     (index) => Item(
// //       name: 'Item ${index + 1}',
// //       stock: 30,
// //     ),
// //   );

// //   int totalItemsAdded = 0;

// //   void _updateTotalItemsAdded() {
// //     int sum = items.fold(0, (total, item) => total + item.addedCount);
// //     setState(() {
// //       totalItemsAdded = sum;
// //     });
// //   }

// //   void _updateItemStock(Item item, int change) {
// //     setState(() {
// //       item.addedCount += change;
// //       item.stock -= change;
// //       if (item.stock < 0) item.stock = 0; // Prevent stock from going negative
// //       _updateTotalItemsAdded();
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Item List'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: items.length,
// //               itemBuilder: (context, index) {
// //                 final item = items[index];
// //                 return ListTile(
// //                   title: Text(item.name),
// //                   subtitle: Text('Stock: ${item.stock}'),
// //                   trailing: Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       IconButton(
// //                         icon: const Icon(Icons.remove),
// //                         onPressed: () {
// //                           setState(
// //                             () {
// //                               if (item.addedCount > 0) {
// //                                 _updateItemStock(item, -1);
// //                               }
// //                             },
// //                           );
// //                         },
// //                       ),
// //                       Text('${item.addedCount}'),
// //                       IconButton(
// //                         icon: const Icon(Icons.add),
// //                         onPressed: () {
// //                           setState(
// //                             () {
// //                               if (item.stock > 0) {
// //                                 _updateItemStock(item, 1);
// //                               }
// //                             },
// //                           );
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Text(
// //               'Total Items Added: $totalItemsAdded',
// //               style: const TextStyle(fontSize: 20),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class Item {
// //   final String name;
// //   int stock;
// //   int addedCount;

// //   Item({
// //     required this.name,
// //     required this.stock,
// //     this.addedCount = 0,
// //   });
// // }

//   List<Item> items = [];
//   int totalItemsAdded = 0;
//   double totalPrice = 0.0;

//   int totalItemsSelected = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadItems();
//   }

//   Future<void> _loadItems() async {
//     final data = await rootBundle.loadString('assets/json/items.json');
//     final jsonResult = json.decode(data) as List;
//     setState(() {
//       items = jsonResult.map((item) => Item.fromJson(item)).toList();
//     });
//   }

//   void _updateTotalItemsAdded() {
//     int sum = items.fold(0, (total, item) => total + item.addedCount);
//     setState(() {
//       totalItemsAdded = sum;
//     });
//   }

//   void _updateTotalPrice() {
//     double sum = items.fold(
//         0.0, (total, item) => total + (item.addedCount * item.price));
//     setState(() {
//       totalPrice = sum;
//     });
//   }

//   void _updateTotalItemsSelected() {
//     int count = items.where((item) => item.addedCount > 0).length;
//     setState(() {
//       totalItemsSelected = count;
//     });
//   }

//   void _updateItemStock(Item item, int change) {
//     setState(() {
//       item.addedCount += change;
//       item.stock -= change;
//       if (item.stock < 0) item.stock = 0; // Prevent stock from going negative
//       _updateTotalItemsAdded();
//       _updateTotalPrice();
//       _updateTotalItemsSelected();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Item List'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 final item = items[index];
//                 final totalItemPrice = item.addedCount * item.price;
//                 return ListTile(
//                   title: Text(item.name),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Price: Rp ${item.price.toStringAsFixed(2)}'),
//                       Text('Stock: ${item.stock}'),
//                       Text(
//                           'Total Price: Rp ${totalItemPrice.toStringAsFixed(0)}'),
//                     ],
//                   ),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.remove),
//                         onPressed: () {
//                           if (item.addedCount > 0) {
//                             _updateItemStock(item, -1);
//                           }
//                         },
//                       ),
//                       Text('${item.addedCount}'),
//                       IconButton(
//                         icon: const Icon(Icons.add),
//                         onPressed: () {
//                           if (item.stock > 0) {
//                             _updateItemStock(item, 1);
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Total Items Selected: $totalItemsSelected',
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Total Items Added: $totalItemsAdded',
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Total Price: Rp ${totalPrice.toStringAsFixed(0)}',
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
// }
