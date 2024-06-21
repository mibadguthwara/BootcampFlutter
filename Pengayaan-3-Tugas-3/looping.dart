void main(List<String> args) {
  // soal2A();
  soal2B();
}

soal2A() {
  print('Angka 1 sampai 10');
  for (var i = 1; i <= 10; i++) {
    print(i);
  }
  print("");
  print("Angka 10 sampai 1");
  for (var j = 10; j >= 1; j--) {
    print(j);
  }
}

soal2B() {
  int angkaBerurutan = 1;
  while (angkaBerurutan <= 10) {
    print("Angka berurutan ke-$angkaBerurutan");
    angkaBerurutan++;
  }
  print("");
  int angkaTerbalik = 10;
  while (angkaTerbalik >= 1) {
    print("Agka terbalik ke-$angkaTerbalik");
    angkaTerbalik--;
  }
}
