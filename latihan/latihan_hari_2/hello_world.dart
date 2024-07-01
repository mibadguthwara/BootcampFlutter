void main() {
  // print("Hello World");
//   for (int i = 1; i <= 10; i++) {
//     if (i == 5) {
//       continue;
//     }
//     print(i);
//   }
  final cek = luasSegitiga(5, 8);
  print(cek);

  final luasSegitiga2 = (double alas, double tinggi) => 0.5 * alas * tinggi;
  print(luasSegitiga2(5, 8));
}

double luasSegitiga(double alas, double tinggi) => 0.5 * alas * tinggi;

// class Person extends Student {
// final int studentId;

// const Student(String name, int age, this.studentId) : super(name, age);
// }

// class Person extends Student {
//   final int studentId;

//   Student(String name, int age, this.studentId) : super(name, age);
// }

class Student extends Person {
  // final String name;
  final int studentId;

  Student(String name, int age, this.studentId) : super(name, age);
}

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}
