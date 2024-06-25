void main() {
  print(rangeWithStep(1, 10, step: 2));
  print(rangeWithStep(11, 23, step: 3));
  print(rangeWithStep(5, 2, step: 1));
}

Iterable<int> rangeWithStep(int startNum, int finishNum, {int step = 1}) sync* {
  if (startNum < finishNum) {
    for (var i = startNum; i <= finishNum; i += step) {
      yield i;
    }
  } else {
    for (var i = startNum; i >= finishNum; i -= step) {
      yield i;
    }
  }
}
