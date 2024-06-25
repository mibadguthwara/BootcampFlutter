void main(List<String> args) {
  // pembuatan instance atau object dari class persegi panjang
  final kertas = PersegiPanjang(21, 24);

  // pemanggilan properti dari kertas
  final panjangKertas = kertas.panjang;
  final lebarKertas = kertas.lebar;

  //pemanggilan fungsi dari kertas
  final luasKertas = kertas.hitungLuas;

  // menampilkan hasil
  print(panjangKertas);
  print(lebarKertas);
  print(luasKertas);
}

class PersegiPanjang {
  // properti atau variabel
  final num panjang;
  final num lebar;

  // construktor (harus ada di dalam class)
  const PersegiPanjang(this.panjang, this.lebar);

  // method atau fundsi dari class
  num hitungLuas() {
    return panjang * lebar;
  }
}
