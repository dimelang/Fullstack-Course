void loop() {
  for (int i = 0; i < 5; i++) {
    print(i);
  }

  for (int j = 5; j > 0; j--) {
    print(j);
  }

  List<int> data = [55, 78, 65, 63, 72, 81];
  for (int i = 0; i < data.length; i++) {
    print(data[i]);
  }

  for (int x in data) {
    print(x);
  }

  int x = 0;
  while (x < 5) {
    print(x);
    x++;
  }

  int j = 0;
  while (j < data.length) {
    print(data[j]);
    j++;
  }

  do {
    print(j);
    j++;
  } while (j < data.length);
}
