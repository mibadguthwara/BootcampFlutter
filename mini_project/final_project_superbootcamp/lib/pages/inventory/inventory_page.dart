import '/pages/inventory/inventory_add_page.dart';
import '/pages/inventory/inventory_detail_page.dart';
import 'package:flutter/material.dart';

import '../main_page.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  String _selectedValue = 'Alphabet (A-Z)';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            children: [
              const Row(
                children: [
                  Flexible(
                    child: Chip(
                      label: Row(
                        children: [
                          Text(
                            "1",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Text("items"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Chip(
                      label: Row(
                        children: [
                          Text(
                            "40",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Text("stocks"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Urutkan list berdasarkan"),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedValue,
                    items: <String>[
                      'Alphabet (A-Z)',
                      'Alphabet (Z-A)',
                      'Stock (0-9)',
                      'Stock (9-0)'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue!;
                      });
                    },
                    dropdownColor: Colors.grey[200],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  InkWell(
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/lemper_ayam.jpg",
                        height: 50,
                        width: 50,
                      ),
                      title: const Text(
                        "Lemper Ayam",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rp 2.500"),
                          Text("Stock: 40"),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const InventoryDetailPage();
                      }));
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/onde_onde.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Onde-onde",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 1.500"),
                        Text("Stock: 15"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/nagasari.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Nagasari",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 1.500"),
                        Text("Stock: 30"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/gemblong.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Gemblong",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 2.000"),
                        Text("Stock: 27"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/ketan_serundeng.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Ketan Serundeng",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 2.500"),
                        Text("Stock: 10"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/kue_sus.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Kue Sus",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 4.000"),
                        Text("Stock: 10"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/donut_bomboloni.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Donut Bomboloni",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 5.000"),
                        Text("Stock: 14"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/pie_buah.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Pie Buah",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 2.500"),
                        Text("Stock: 5"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/risol_mayones.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Risol Mayones",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 2.000"),
                        Text("Stock: 8"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/kue_lapis.jpg",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Kue Lapis",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp 2.000"),
                        Text("Stock: 3"),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
