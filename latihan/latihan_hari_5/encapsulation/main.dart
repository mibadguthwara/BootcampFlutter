import 'class_karyawan.dart';

void main(List<String> args) {
  // inisialisasi class karyawan
  final tatang = Karyawan(5000000);

  // panggil properti (gaji pokok)
  print("Gaji Pokok Tatang:  ${tatang.gajiPokok}");

  // panggil fungsi (take home pay)
  print("Gaji Bersih Tatang:  ${tatang.takeHomePay()}");

  // panggil potongan
  // print("Potongan gaji: ${tatang._potongan}"); // tidak bisa memanggil karena encapsulation
}
