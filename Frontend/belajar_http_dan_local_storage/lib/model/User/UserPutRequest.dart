class Userputrequest {
  final String? name;
  final String? email;
  final String? password;
  final String? roles;

  // constructor
  Userputrequest({this.name, this.email, this.password, this.roles});

  // convert JSON to Userputrequest class
  factory Userputrequest.fromJson(Map<String, dynamic> json) {
    return Userputrequest(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        roles: json['roles']);
  }

  // convert Userputrequest class to JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password, 'roles': roles};
  }
}
