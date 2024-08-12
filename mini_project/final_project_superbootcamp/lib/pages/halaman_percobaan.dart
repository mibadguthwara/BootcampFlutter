import 'package:flutter/material.dart';

class HalamanPercobaan extends StatefulWidget {
  const HalamanPercobaan({super.key});

  @override
  State<HalamanPercobaan> createState() => _HalamanPercobaanState();
}

class _HalamanPercobaanState extends State<HalamanPercobaan> {
  List<Item> items = List.generate(
    5,
    (index) => Item(
      name: 'Item ${index + 1}',
      stock: 30,
    ),
  );

  int totalItemsAdded = 0;

  void _updateTotalItemsAdded() {
    int sum = items.fold(0, (total, item) => total + item.addedCount);
    setState(() {
      totalItemsAdded = sum;
    });
  }

  void _updateItemStock(Item item, int change) {
    setState(() {
      item.addedCount += change;
      item.stock -= change;
      if (item.stock < 0) item.stock = 0; // Prevent stock from going negative
      _updateTotalItemsAdded();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Stock: ${item.stock}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(
                            () {
                              if (item.addedCount > 0) {
                                _updateItemStock(item, -1);
                              }
                            },
                          );
                        },
                      ),
                      Text('${item.addedCount}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(
                            () {
                              if (item.stock > 0) {
                                _updateItemStock(item, 1);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Items Added: $totalItemsAdded',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String name;
  int stock;
  int addedCount;

  Item({
    required this.name,
    required this.stock,
    this.addedCount = 0,
  });
}
