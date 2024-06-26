// ignore_for_file: public_member_api_docs, sort_constructors_first
void main(List<String> args) {
  // // mahasiswa
  // final dataMahasiswa = Siswa("Ibad", 1016, 80);
  // dataMahasiswa.informasiMahasiswa();

  // // Persegi Panjang
  // final dataPersegiPanjang = PersegiPanjang(5, 10);

  // final nilaiPanjang = dataPersegiPanjang.panjang;
  // final nilaiLebar = dataPersegiPanjang.lebar;

  // final nilaiLuas = dataPersegiPanjang.luasPersegiPanjang();
  // final nilaiKeliling = dataPersegiPanjang.kelilingPersegiPanjang();

  // print("Panjang Persegi Panjang: $nilaiPanjang");
  // print("Lebar Persegi Panjang: $nilaiLebar");
  // print("Luas Persegi Panjang: $nilaiLuas");
  // print("Keliling Persegi Panjang: $nilaiKeliling");

  // // buku
  // final dataBuku = Buku("Laptop viral", "M Ibad Guthwara", 2024);
  // dataBuku.tampilInformasiBuku();

  // // mobil
  final dataMobil = Mobil("Toyota", "Rush", 2023);
  dataMobil.turnOnCar();
  dataMobil.turnOffCar();

  // kucing
  // var kucingRumah = Kucing("Miming", 2, 10, "Meong");

  // print(kucingRumah.nama);
  // print(kucingRumah.beratBadan);
  // print(kucingRumah.umur);
  // print(kucingRumah.suara);

  // kucingRumah.berjalan();
  // print("Kucing melihat makanan");
  // kucingRumah.makan();
}

// soal 1
class Siswa {
  final String nama;
  final int nip;
  final int nilai;

  Siswa(this.nama, this.nip, this.nilai);

  informasiMahasiswa() {
    print("Informasi Mahasiswa");
    print("Nama: $nama");
    print("NIP: $nip");
    print("Nilai: $nilai");
    if (nilai > 70) {
      print("$nama Anda Lulus! (nilai lebih besar dari 70)");
    }
  }
}

// soal 2
class PersegiPanjang {
  final num panjang;
  final num lebar;

  PersegiPanjang(this.panjang, this.lebar);

  num luasPersegiPanjang() {
    return panjang * lebar;
  }

  num kelilingPersegiPanjang() {
    return 2 * (panjang + lebar);
  }
}

// soal 3
class Buku {
  final String judul;
  final String penulis;
  final int tahunTerbit;

  Buku(this.judul, this.penulis, this.tahunTerbit);

  tampilInformasiBuku() {
    print("Informasi Buku");
    print("Judul: $judul");
    print("Penulis: $penulis");
    print("Tahun Terbit: $tahunTerbit");
  }
}

// soal 4
class Mobil {
  final String merek;
  final String model;
  final int tahunProduksi;

  Mobil(this.merek, this.model, this.tahunProduksi);

  turnOnCar() {
    print(
        "Menyalakan mesin mobil dengan merek $merek model $model tahun produksi $tahunProduksi");
  }

  turnOffCar() {
    print(
        "Mematikan mesin mobil dengan merek $merek model $model tahun produksi $tahunProduksi");
  }
}

// soal 5
class Hewan {
  final String nama;
  final int umur;
  final double beratBadan;

  Hewan(this.nama, this.umur, this.beratBadan);

  makan() {
    print("$nama sedang makan");
  }

  tidur() {
    print("$nama sedang tidur");
  }
}

class Kucing extends Hewan {
  final String suara;

  Kucing(super.nama, super.umur, super.beratBadan, this.suara);

  berjalan() {
    print("Kucing sedang berjalan");
  }
}
