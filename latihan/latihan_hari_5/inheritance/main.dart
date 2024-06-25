import 'kertas.dart';

void main(List<String> args) {
  // pembuatan instance atau object dari class [Kertas]
  final kertas = Kertas(45, 20, "putih");

  final panjangKertas = kertas.panjang;
  final lebarKertas = kertas.lebar;
  final warnaKertas = kertas.warna;

  print(warnaKertas);
  kertas.gantiWarna("warnaBaru");
  print(panjangKertas);
  print(lebarKertas);
  print(kertas.warna);
}
