class Usergetrequest {
  final int id;
  final String name;
  final String email;
  final String role;

  // constructor
  Usergetrequest(
      {required this.id,
      required this.name,
      required this.email,
      required this.role});

  // convert JSON to User class
  factory Usergetrequest.fromJson(Map<String, dynamic> json) {
    return Usergetrequest(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        role: json['role']);
  }

  // convert User class to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'role': role};
  }
}
