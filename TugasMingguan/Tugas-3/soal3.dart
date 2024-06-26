void main() {
  print("Live");
  // memanggil method
  delayedPrint(3, "never flat").then((value) {
    print(value);
  });
  print("is");
}

// membuat method untuk mendelay message dengan durasi tertentu
Future delayedPrint(int seconds, String message) {
  final duration = Duration(seconds: seconds);
  return Future.delayed(duration).then((value) => message);
}
