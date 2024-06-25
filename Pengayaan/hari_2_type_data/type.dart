import 'dart:io';

void main() {
  // soalNomor 1
  /*
      a. perbedaan pada angka tersebut desimal atau bulat. keduanya bisa bernilai minus (-), contoh integer: -5, 0, 3; contoh float: -5.2, 0.1, 3.6:
      b. String namaLengkap = "M. Ibad Guthwara";
      String singleQuote = 'Ini adalah String';
      String doubleQuote = "Ini juga String";
      print(namaLengkap);
  */
  // soalNomor2();
  // soalNomor3();
  // soalNomor4();
  // soalNomor5();
}

soalNomor2() {
  var word = 'dart';
  var second = 'is';
  var third = 'awesome';
  var fourth = 'and';
  var fifth = 'I';
  var sixth = 'love';
  var seventh = 'it!';

  print('$word $second $third $fourth $fifth $sixth $seventh');
}

soalNomor3() {
  var sentence = "I am going to be Flutter Developer";

  var exampleFirstWord = sentence[0];
  var exampleSecondWord = sentence[2] + sentence[3];
  var thridWord =
      sentence[5] + sentence[6] + sentence[7] + sentence[8] + sentence[9];
  var fourthWord = sentence[11] + sentence[12];
  var fifthWord = sentence[14] + sentence[15];
  var sixthWord = sentence[16] +
      sentence[17] +
      sentence[18] +
      sentence[19] +
      sentence[20] +
      sentence[21] +
      sentence[22] +
      sentence[23];
  var seventhWord = sentence[24] +
      sentence[25] +
      sentence[26] +
      sentence[27] +
      sentence[28] +
      sentence[29] +
      sentence[30] +
      sentence[31] +
      sentence[32] +
      sentence[33];

  print('First word: $exampleFirstWord');
  print('Second word: $exampleSecondWord');
  print('Thrid Word: $thridWord');
  print('Fourth Word: $fourthWord');
  print('FifthWord: $fifthWord');
  print('Sixth Word: $sixthWord');
  print('Seventh WOrd: $seventhWord');
}

soalNomor4() {
  stdout.write('Masukkan nama depan: ');
  var namaDepan = stdin.readLineSync()!;
  stdout.write('Masukkan nama belakang: ');
  var namaBelakang = stdin.readLineSync()!;
  print('Nama lengkap anda adalah: $namaDepan $namaBelakang');
}

soalNomor5() {
  int a = 5;
  int b = 10;

  var perkalian = a * b;
  var pembagian = a / b;
  var penambahan = a + b;
  var pengurangan = a - b;

  print("Perkalian : $perkalian");
  print("Pembagian : $pembagian");
  print("Penambahan : $penambahan");
  print("Pengurangan : $pengurangan");
}
