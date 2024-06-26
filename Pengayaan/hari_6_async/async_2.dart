void main() async {
  await tampilkanData();
}

Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Data diterima";
  });
}

Future<void> tampilkanData() async {
  print("cek data");
  final hasil = await fetchData();

  print(hasil);
  print("Selesai");
}
