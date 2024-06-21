import 'dart:io';

void main(List<String> args) {
  print("Pergi ke pasar!");
  print("");
  print("Beliin 1 botol minyak goreng, kalau ada telur, ambil 6.");
  stdout.write("cek apakah ada telur? (ada/tidak) : ");
  var isTelur = stdin.readLineSync();
  if (isTelur == "ada") {
    print("ambil 6 Minyak goreng");
  } else if (isTelur == "tidak") {
    print("beli 1 Minyak goreng");
  }
}
