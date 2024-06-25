import 'dart:io';

void main(List<String> args) {
  // soal3A();
  soal3B("M. Ibad Guthwara", 25, "Teknik Informatika");
}

soal3A() {
  stdout.write("Masukkan nilai panjang Persegi Panjang: ");
  var nilaiPanjang = num.parse(stdin.readLineSync()!);
  stdout.write("Masukkan nilai lebar Persegi Panjang: ");
  var nilaiLebar = num.parse(stdin.readLineSync()!);

  var nilaiLuas = nilaiPanjang * nilaiLebar;
  var nilaiKeliling = 2 * (nilaiPanjang + nilaiLebar);

  print("");

  print("Luas Persegi Panjang adalah: $nilaiLuas");
  print("Keliling Persegi Panjang adalah: $nilaiKeliling");
}

void soal3B(String nama, int usia, String jurusan) {
  print("Informasi Mahasiswa");
  print("Nama: $nama");
  print("Usia: $usia");
  print("Jurusan: $jurusan");
}
