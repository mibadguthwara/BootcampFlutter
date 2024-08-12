import 'package:flutter/material.dart';

import 'inventory_page.dart';

class InventoryAddPage extends StatelessWidget {
  const InventoryAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data Makanan"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/flutter.png",
                height: 200,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                child: const Text(
                  "Unggah Gambar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Nama Makanan",
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.food_bank_outlined),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Harga Jual",
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.money),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Stok",
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.storage),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                minLines: 5,
                maxLines: 8,
                decoration: const InputDecoration(
                  labelText: "Deskripsi Makanan",
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const InventoryPage();
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil Menambahkan Data Makanan'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: const Text(
                  "Simpan Data Makanan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
