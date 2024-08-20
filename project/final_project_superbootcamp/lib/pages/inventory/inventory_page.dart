import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/item.dart';
import 'inventory_add_page.dart';
import 'inventory_detail_page.dart';
import '../main_page.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, Item> _items = {};

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
            imageUrl: doc['image_url'],
            description: doc['description'],
            quantity: 0,
          ),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Data Makanan"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const InventoryAddPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.format_list_bulleted_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chip(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Display the total count of items
                    StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('items').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData || snapshot.data == null) {
                          return const Center(
                              child: Text('No items available.'));
                        }

                        final itemCount = snapshot.data!.docs.length;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '$itemCount',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "items",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    // Display the total stock of items
                    StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('items').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData || snapshot.data == null) {
                          return const Center(
                              child: Text('No items available.'));
                        }

                        final totalStock = snapshot.data!.docs
                            .map((doc) => doc['stock'] as int)
                            .reduce((a, b) => a + b);

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '$totalStock',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "stocks",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('items').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text('No items available.'));
                  }

                  return ListView(
                    children: _items.values.map(
                      (item) {
                        return InkWell(
                          child: ListTile(
                            leading: SizedBox(
                              child: Image.network(
                                item.imageUrl,
                                height: 80,
                                width: 80,
                              ),
                            ),
                            title: Text(
                              item.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Rp ${item.price}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            trailing: Text(
                              "Stok: ${item.stock}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return InventoryDetailPage(
                                    id: item.id,
                                    name: item.name,
                                    stock: item.stock,
                                    price: item.price,
                                    imageUrl: item.imageUrl,
                                    description: item.description,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
