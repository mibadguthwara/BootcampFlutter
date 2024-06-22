void main() {
  // No.1
  // print(teriak());

  // No. 2;
  // int num1 = 12;
  // int num2 = 4;
  // int hasilKali = kalikan(num1, num2);
  // print(hasilKali);

  // No. 3;
  // var name = "Agus";
  // var age = 30;
  // var address = "Jln. Malioboro, Yogyakarta";
  // var hobby = "Gaming";
  // var perkenalan = introduce(name, age, address, hobby);
  // print(perkenalan);

  // No. 4;
  // var result = faktorial(6);
  // print(result);
}

// No. 1
teriak() {
  return "Halo Sanbers!";
}

// No. 2
kalikan(int num1, int num2) {
  return num1 * num2;
}

// No. 3
introduce(String name, int age, String address, String hobby) {
  return "Nama Saya $name, umur saya $age tahun, alamat saya di $address, dan saya punya hobby yaitu $hobby";
}

// No. 4
int faktorial(int n) {
  if (n <= 0) {
    return 1;
  } else {
    return n * faktorial(n - 1);
  }
}
