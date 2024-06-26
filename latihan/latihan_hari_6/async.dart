void main(List<String> args) {
  menunggu();
}

Future<void> menunggu() async {
  print("1");
  print("2");
  print("3");

  // cetak sampi habis/semua, kemudian delay 2 detik lalu print.
  // Future.delayed(Duration(seconds: 2), () {
  //   print("3.5");
  // });

  // delay 2 detik dulu, baru lanjut print perintah berikutnya/bawahnya
  await Future.delayed(Duration(seconds: 2), () {
    print("3.5");
  });

  print("4");
}
