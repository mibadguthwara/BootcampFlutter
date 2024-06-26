void main() async {
  // membuat object
  var h = Human();

  print("Luffy");
  print("Zoro");
  print("Killer");
  // memanggil variable name di class human
  print(h.name);
  // memanggil method getData()
  await h.getData();
  print(h.name);
}

class Human {
  String name = "nama character one piece";

  // method getData() untuk mendeley pesan
  Future<void> getData() async {
    await Future.delayed(Duration(seconds: 3));
    name = "hilmy";
    print("get data [done]");
  }
}
