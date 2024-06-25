import 'dart:io';

void main(List<String> args) {
  soal1A();
  // soal1B();
}

soal1A() {
  var isOpenToko = "buka";

  if (isOpenToko == "buka") {
    print("Saya akan membeli telur");
  } else {
    print('Saya akan datang lagi esok hari');
  }
}

soal1B() {
  stdout.write('Masukkan nilai ujian: ');
  var nilai = num.parse(stdin.readLineSync()!);

  switch (nilai) {
    case >= 80:
      print("A: Sangat Baik");
      break;
    case >= 70 && <= 79:
      print("B: Baik");
    case >= 60 && <= 69:
      print("C: Kurang");
      break;
    case >= 50 && <= 59:
      print("D: Kurang");
      break;
    case <= 50:
      print("E: Sangat Kurang");
      break;
    default:
      print("Nilai tidak dalam rentang");
  }
}
