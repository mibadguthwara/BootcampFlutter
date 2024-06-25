class Karyawan {
  // properti public
  final num gajiPokok;

  // properti private, ditulis dengan awalan _(underscore)
  final num _potongan = 0.025;

  const Karyawan(this.gajiPokok);

  num takeHomePay() {
    return gajiPokok - (gajiPokok * _potongan);
  }
}
