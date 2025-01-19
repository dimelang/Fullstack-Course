import 'Car.dart';

class Toyota extends Car {
  String? name;
  String _brand = "Toyota";
  int? price;

  Toyota(String type, String color, String name, int price) {
    super.type = type;
    super.color = color;
    this.name = name;
    this.price = price;
  }

  void display() {
    print("Brand: ${_brand}");
    print("Type: ${super.type}");
    print("Color: ${super.color}");
    print("Name: ${name}");
    print("Price: ${price}");
  }

  @override
  void change_type() {
    super.type = "New type A";
    super.change_type();
  }
}
