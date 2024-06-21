void main(List<String> args) {
  helloWorld();
  kalikan();
  functionParams(3, 4);
}

helloWorld() {
  print("Hello World!");
}

kalikan() {
  int angka1 = 10;
  int angka2 = 30;

  print(angka1 * angka2);
}

functionParams(angka3, angka4) {
  print(angka3 * angka4);
}
