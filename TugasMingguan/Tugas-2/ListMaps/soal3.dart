void main(List<String> args) {
  dataHandling();
}

dataHandling() {
  List<List> input = [
    ["001", "Roman Alamsyah", "Bandar Lampung", "21/05/1989", "Membaca"],
    ["002", "Dika Sembiring", "Medan", "10/10/1992", "Bermain Gitar"],
    ["003", "Winona", "Ambon", "25/12/1965", "Memasak"],
    ["004", "Bintang Senjaya", "Martapura", "06/04/1970", "Berkebun"],
  ];

  for (var element in input) {
    print("Nomor ID: ${element[0]}");
    print("Nama Lengkap: ${element[1]}");
    print("TTL: ${element[2]} ${element[3]}");
    print("Hobi: ${element[4]}");
    print("");
  }
}
