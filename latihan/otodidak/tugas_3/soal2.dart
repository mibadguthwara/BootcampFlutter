// void main(List<String> args) {
//   var h = Human();

//   print("Luffy");
//   print("Zoro");
//   print("Killer");

//   h.getData();
//   print(h.name);
// }

// class Human {
//   String name = "nama character one piece";

//   void getData() {
//     name = "hilmy";
//     print("get data [done]");
//   }
// }

// void main(List<String> args) {
//   tampilkanNamaKarakter();
// }

// Future<void> tampilkanNamaKarakter() async {
//   print("Luffy");
//   print("Zoro");
//   print("Killer");

//   await Future.delayed(Duration(seconds: 3), () {
//     print("hilmy");
//     print("get data [done]");
//   });
// }

void main(List<String> args) async {
  var h = Human();

  print("Luffy");
  print("Zoro");
  print("Killer");
  print(h.name);
  await h.getData();
  print(h.name);
}

class Human {
  String name = "nama character one piece";

  Future<void> getData() async {
    await Future.delayed(Duration(seconds: 3));
    name = "hilmy";
    print("get data [done]");
  }
}
