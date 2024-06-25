void main() {
  print(range(1, 10));
  print(range(11, 18));
  print(range(10, 1));
}

Iterable<int> range(int startNum, int finishNum) sync* {
  if (startNum < finishNum) {
    for (var i = startNum; i <= finishNum; i++) {
      yield i;
    }
  } else {
    for (var i = startNum; i >= finishNum; i--) {
      yield i;
    }
  }
}
