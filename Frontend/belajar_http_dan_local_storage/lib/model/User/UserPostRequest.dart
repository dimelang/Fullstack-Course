class Userpostrequest {
  final String name;
  final String email;
  final String password;
  final String role;

  // constructor
  Userpostrequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.role});

  // convert JSON to User class
  factory Userpostrequest.fromJson(Map<String, dynamic> json) {
    return Userpostrequest(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        role: json['role']);
  }

  // convert User class to JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password, 'role': role};
  }
}
