import '/pages/inventory/inventory_edit_page.dart';
import '/pages/inventory/inventory_page.dart';
import 'package:flutter/material.dart';

class InventoryDetailPage extends StatelessWidget {
  const InventoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Makanan"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/lemper_ayam.jpg",
                height: 200,
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lemper Ayam",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp 2.500",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Stok: 40",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel ornare dolor. Vivamus eget metus in massa scelerisque accumsan id id sem. Phasellus eget ex in eros ultrices ultricies. Nullam ultrices massa at ipsum vestibulum, ut venenatis felis interdum. Nam commodo mollis nisi, id porta felis consequat in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus ante id urna tempor suscipit.",
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const InventoryEditPage();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      label: const Text(
                        "Ubah Data Makanan",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Konfirmasi'),
                              content: const Text(
                                  'Apakah Anda yakin akan menghapus data makanan? Data akan dihapus permanen.'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text(
                                    'Batal',
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
                                          return const InventoryPage();
                                        },
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Berhasil Menghapus Data Makanan'),
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
                                    "Hapus",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
