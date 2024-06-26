void main(List<String> args) async {
  Stream<int> stream = countStream(5);
  await for (int value in stream) {
    print(value);
  }
}

Stream<int> countStream(int max) async* {
  for (var i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
