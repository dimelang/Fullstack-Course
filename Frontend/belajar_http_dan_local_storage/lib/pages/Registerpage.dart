import 'package:belajar_http_dan_local_storage/helper/Helper.dart';
import 'package:belajar_http_dan_local_storage/model/User/UserPostRequest.dart';
import 'package:belajar_http_dan_local_storage/service/UserService.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final Userservice userservices = Userservice();
  final _formKey = GlobalKey<FormState>();
  final Helper helpers = Helper();
  bool _isHidden = true;
  bool _confirm_password_hide = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(helpers.colorFromHex('#2E5077')),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.2,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Color(helpers.colorFromHex('#2E5077')),
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 38,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text(
                      "Daftar akun",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          ),
          Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  spacing: 15,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        labelStyle: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(helpers.colorFromHex('#4DA1A9')),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username wajib diisi";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        labelStyle: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(helpers.colorFromHex('#4DA1A9')),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email wajib diisi";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                            icon: _isHidden
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        contentPadding: EdgeInsets.all(20),
                        labelStyle: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(helpers.colorFromHex('#4DA1A9')),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password wajib diisi";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: _confirm_password_hide,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _confirm_password_hide =
                                    !_confirm_password_hide;
                              });
                            },
                            icon: _confirm_password_hide
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        contentPadding: EdgeInsets.all(20),
                        labelStyle: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(helpers.colorFromHex('#4DA1A9')),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Konfirmasi Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Konfirmasi password wajib diisi";
                        }

                        if (value != _passwordController.text) {
                          return "Konnfirmasi password tidak cocok";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.all(25),
            child: SizedBox(
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Color(helpers.colorFromHex('#79D7BE')),
                child: InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Userpostrequest user = Userpostrequest(
                          name: _usernameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          role: "GUEST");
                      var url = "http://localhost:8080/api/users";
                      bool response = await userservices.createUser(user, url);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(response
                              ? "Registrasi berhasil"
                              : "Registrasi gagal"),
                          backgroundColor:
                              response ? Colors.green : Colors.red));
                      if (response) {
                        await Future.delayed(Duration(seconds: 1)).then(
                          (value) {
                            Navigator.pop(context);
                          },
                        );
                      }
                    }
                  },
                  child: Center(
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(helpers.colorFromHex('#F6F4F0'))),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "Sudah punya akun?",
                  style: TextStyle(fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color(helpers.colorFromHex('#2E5077')),
                          fontSize: 14),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
