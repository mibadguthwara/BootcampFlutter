// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'inventory_page.dart';

class InventoryEditPage extends StatefulWidget {
  final String id; // Add an id field to identify the item in Firestore
  final String name;
  final int stock;
  final int price;
  final String imageUrl;
  final String description;

  const InventoryEditPage({
    super.key,
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  @override
  State<InventoryEditPage> createState() => _InventoryEditPageState();
}

class _InventoryEditPageState extends State<InventoryEditPage> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _newImageUrl;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _priceController.text = widget.price.toString();
    _stockController.text = widget.stock.toString();
    _descriptionController.text = widget.description;
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = pickedFile.path;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('food_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(File(file));
      final downloadUrl = await storageRef.getDownloadURL();
      setState(() {
        _newImageUrl = downloadUrl;
      });
    }
  }

  Future<void> _updateItem() async {
    final updatedData = {
      'name': _nameController.text,
      'price': int.tryParse(_priceController.text) ?? widget.price,
      'stock': int.tryParse(_stockController.text) ?? widget.stock,
      'description': _descriptionController.text,
      'image_url': _newImageUrl ?? widget.imageUrl,
    };

    await FirebaseFirestore.instance
        .collection('items')
        .doc(widget.id)
        .update(updatedData);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const InventoryPage()),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Berhasil Memperbaharui Data Makanan'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Data Makanan"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _newImageUrl != null
                  ? Image.network(_newImageUrl!, height: 200)
                  : Image.network(widget.imageUrl, height: 200),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                child: const Text(
                  "Ubah Gambar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
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
                      controller: _priceController,
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
                      controller: _stockController,
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
                controller: _descriptionController,
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
                onPressed: _updateItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                icon: const Icon(
                  Icons.update,
                  color: Colors.white,
                ),
                label: const Text(
                  "Perbaharui Data Makanan",
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
