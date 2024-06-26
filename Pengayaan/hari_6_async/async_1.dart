import 'dart:io';

void main() async {
  delayPrint();
}

Future<void> delayPrint() async {
  stdout.write("Masukkan kata: ");
  var kata = stdin.readLineSync();
  print("mohon menunggu 3 detik!");
  await Future.delayed(Duration(milliseconds: 3000));
  print("Berhasil mencetak \'$kata'");
}
