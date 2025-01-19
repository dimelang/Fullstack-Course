int jumlah(List<int> data) {
  int total = 0;
  for (int x in data) {
    total += x;
  }
  return total;
}

void greetings(String name) {
  print("Hello ${name}");
}

bool isEven(int x) {
  return x % 2 == 0;
}
