void main() async {
  print("Ready. Sing");
  print(await line());
  print(await line2());
  print(await line3());
  print(await line4());
}

Future<String> line() async {
  String greeting = "Pernakah kau merasa";
  return await Future.delayed(Duration(seconds: 5), () => (greeting));
}

Future<String> line2() async {
  String greeting = "Pernakah kau merasa . . .";
  return await Future.delayed(Duration(seconds: 3), () => (greeting));
}

Future<String> line3() async {
  String greeting = "Pernakah kau merasa";
  return await Future.delayed(Duration(seconds: 2), () => (greeting));
}

Future<String> line4() async {
  String greeting = "Hatimu hampa, pernakah kau merasa hatimu kosong";
  return await Future.delayed(Duration(seconds: 1), () => (greeting));
}
