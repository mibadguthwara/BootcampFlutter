void main(List<String> args) {
  try {
    int result = 10 ~/ 0;
    print("Result $result");
  } catch (e) {
    print("Erorr: $e");
  }
}
