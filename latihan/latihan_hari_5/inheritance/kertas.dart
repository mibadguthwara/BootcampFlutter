import 'persegi_panjang.dart';

class Kertas extends PersegiPanjang2 {
  String warna;

  Kertas(super.panjang, super.lebar, this.warna);

  void gantiWarna(String warnaBaru) {
    warna = warnaBaru;
  }
}
