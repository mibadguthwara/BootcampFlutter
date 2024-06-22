void main(List<String> args) {
  // No. 1
  // loopingWhile();

  // No. 2
  // loopingFor();

  // No. 3
  // persegiPanjang();

  // No. 4
  // membuatTangga();
}

// No. 1
loopingWhile() {
  var i = 2;
  var j = 20;

  print("LOOPING YANG PERTAMA");
  while (i <= 20) {
    if (i % 2 == 0) {
      print("$i - I love coding");
    }
    i++;
  }
  print("LOOPING KEDUA");
  while (j >= 2) {
    if (j % 2 == 0) {
      print("$j - I will become a mobile developer");
    }
    j--;
  }
}

// No. 2
loopingFor() {
  for (var i = 1; i <= 20; i++) {
    if (i % 2 == 1) {
      if (i % 3 == 0) {
        print("$i - I Love Coding");
        continue;
      }
      print("$i - Santai");
    }
    if (i % 2 == 0) {
      print("$i - Berkualitas");
    }
  }
}

// No. 3
persegiPanjang() {
  // PERULANGAN WHILE
  var i = 1;
  while (i <= 4) {
    print("########");
    i++;
  }

  // PERULANGAN FOR
  // for (var i = 0; i < 4; i++) {
  //   print("########");
  // }

  // PERULANGAN DO WHILE
  // var j = 1;
  // do {
  //   print("########");
  //   j++;
  // } while (j <= 4);
}

// No. 4
membuatTangga() {
  // PERULANGAN WHILE
  var i = 1;
  while (i <= 7) {
    print("#" * i);
    i++;
  }

  // PERULANGAN FOR
  // for (int i = 1; i <= 7; i++) {
  //   print("#" * i);
  // }

  // PERULANGAN DO WHILE
  // var i = 1;
  // do {
  //   print("#" * i);
  //   i++;
  // } while (i <= 7);
}
