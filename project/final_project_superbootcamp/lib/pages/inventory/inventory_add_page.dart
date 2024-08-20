// ignore_for_file: use_build_context_synchronously, avoid_print, library_private_types_in_public_api

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InventoryAddPage extends StatefulWidget {
  const InventoryAddPage({super.key});

  @override
  _InventoryAddPageState createState() => _InventoryAddPageState();
}

class _InventoryAddPageState extends State<InventoryAddPage> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  String _imageUrl = '';
  bool _isLoading = false;

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadData() async {
    if (_imageFile == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Upload image
      final ref = FirebaseStorage.instance.ref().child(
          'food_images/${DateTime.now().toIso8601String()}_${_imageFile!.uri.pathSegments.last}');
      await ref.putFile(_imageFile!);
      _imageUrl = await ref.getDownloadURL();

      // Save data to Firestore
      await FirebaseFirestore.instance.collection('items').add({
        'name': _nameController.text,
        'price': int.tryParse(_priceController.text) ?? 0,
        'stock': int.tryParse(_stockController.text) ?? 0,
        'description': _descriptionController.text,
        'image_url': _imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data successfully uploaded')),
      );

      // Clear form
      setState(() {
        _imageFile = null;
        _nameController.clear();
        _priceController.clear();
        _stockController.clear();
        _descriptionController.clear();
      });
    } catch (e) {
      print('Error uploading data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload data')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
              if (_imageFile != null)
                Image.file(
                  _imageFile!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
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
                  "Unggah Gambar",
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
                onPressed: _isLoading ? null : _uploadData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                icon: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Icon(Icons.save, color: Colors.white),
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
