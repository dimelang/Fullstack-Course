class Animal {
  String? name;
  int? numberOfLegs;
  int? lifespan;
  String _pemilik = "John"; // private property

  // constructor
  Animal(String name, int num_of_legs, int life) {
    this.name = name;
    this.numberOfLegs = num_of_legs;
    this.lifespan = life;
  }

  // public method
  void display() {
    print("Animal name: $name");
    print("Number of legs: $numberOfLegs");
    print("Life span: $lifespan");
  }

  // private method
  void _gantiNamaHewan() {
    this.name = "John";
  }
}
