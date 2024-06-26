void main(List<String> args) {
  // membuat object
  var SegitigaAsli = Segitiga(0.5, 20, 30);

  // cetak nilai
  print(SegitigaAsli.luasSegitiga());
}

// membuat class
class Segitiga {
  // membuat properti
  final double setengah;
  final double alas;
  final double tinggi;

  // constructor
  Segitiga(this.setengah, this.alas, this.tinggi);

  // membuat method
  luasSegitiga() {
    return setengah * alas * tinggi;
  }
}
