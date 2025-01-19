void operator() {
  int x = 10, y = 20;
  print(x + y); // 30

  int a = 3;
  int b = 5;
  print(b - a); // 2

  print(-a); // -3

  int d = 2;
  int e = 5;
  print(d * e); // 10

  int f = 9;
  int g = 5;
  print(f / g); // 1.8
  print(f ~/ g); // 1

  print(y % a); // 2

  int z = x + y;
  print(z); // 30

  z += 5;
  print(z); // 35

  z -= 30;
  print(z); // 5

  z *= 5;
  print(z); // 25

  z ~/= 7;
  print(z); // 3
}
