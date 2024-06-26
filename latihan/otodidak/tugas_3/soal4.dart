// void main(List<String> args) {
//   print("ready to sing");
//   mainkanLagu();
// }

// Future<void> mainkanLagu() async {
//   await Future.delayed(Duration(seconds: 5), () {
//     print("Pernahkah kau merasa");
//   });
//   await Future.delayed(Duration(seconds: 3), () {
//     print("Pernahkah kau merasa . . . .");
//   });
//   await Future.delayed(Duration(seconds: 2), () {
//     print("Pernahkah kau merasa");
//   });
//   await Future.delayed(Duration(seconds: 1), () {
//     print("Hatimu hampa pernahkah kau merasa hatimu kosong");
//   });
// }

// void main(List<String> args) async {
//   print("Ready. Sing");
//   print(await line());
//   print(await line2());
//   print(await line3());
//   print(await line4());
// }

// Future<String> line() async {
//   String greeting = "Pernakah kau merasa";
//   return await Future.delayed(Duration(seconds: 5), () => (greeting));
// }

// Future<String> line2() async {
//   String greeting = "Pernakah kau merasa . . .";
//   return await Future.delayed(Duration(seconds: 3), () => (greeting));
// }

// Future<String> line3() async {
//   String greeting = "Pernakah kau merasa";
//   return await Future.delayed(Duration(seconds: 2), () => (greeting));
// }

// Future<String> line4() async {
//   String greeting = "Hatimu hampa, pernakah kau merasa hatimu kosong";
//   return await Future.delayed(Duration(seconds: 1), () => (greeting));
// }
