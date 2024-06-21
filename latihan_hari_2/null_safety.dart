import 'dart:io';

void main(List<String> args) {
  // tidak boleh
  // String name;

  // boleh, menggunakan null safety
  // String? name;
  // name = "Muhammad";
  // print(name);

  String namaSaya = stdin.readLineSync()!;
  print(namaSaya);
}
