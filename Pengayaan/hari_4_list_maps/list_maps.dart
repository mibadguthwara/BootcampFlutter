void main(List<String> args) {
  soal1();

  soal2();

  soal3();

  // Soal 4
  Map<String, dynamic> dataDiri = {
    "Nama": "Ibad",
    "Alamat": "Bandung Barat",
    "Email": "mibadguthwara@gmail.com",
    "Phone Number": 089652719053,
  };

  // Soal 5
  print(dataDiri);
  print(dataDiri.keys);
  print(dataDiri.values);

  dataDiri.forEach((key, value) {
    print('$key: $value');
  });
}

soal1() {
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.forEach((element) {
    print(element);
  });
}

soal2() {
  List<String> fruits = ["Apple", "Banana", "Orange"];
  fruits.add("Melon");
  print(fruits);
  fruits.removeLast();
  print(fruits);
}

soal3() {
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  List<int> listTotal = [...list1, ...list2];

  print(listTotal);
}
