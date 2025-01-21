import 'package:belajar_http_dan_local_storage/helper/Helper.dart';
import 'package:belajar_http_dan_local_storage/provider/LoginStatusProvider.dart';
import 'package:belajar_http_dan_local_storage/provider/UserProvider.dart';
import 'package:belajar_http_dan_local_storage/service/SharedPreferencesService.dart';
import 'package:belajar_http_dan_local_storage/service/UserService.dart';
import 'package:belajar_http_dan_local_storage/widgets/HeadAuthPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final Userservice userservice = Userservice();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidden = true;

  final Helper helper = Helper();
  @override
  Widget build(BuildContext context) {
    final loginStatusProvider = Provider.of<Loginstatusprovider>(context);
    final userProvider = Provider.of<Userprovider>(context);
    if (loginStatusProvider.loginStatus()) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/home'));
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()), // Loading sementara
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(helper.colorFromHex('#2E5077')),
      ),
      body: Column(
        children: [
          Headauthpage(),
          Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
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
                                color: Color(helper.colorFromHex('#4DA1A9')),
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
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isHidden ? true : false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                            icon: _isHidden
                                ? Icon(Icons.visibility_off_sharp)
                                : Icon(Icons.visibility_sharp)),
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
                                color: Color(helper.colorFromHex('#4DA1A9')),
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
                    )
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Color(helper.colorFromHex("#79D7BE")),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var url = "http://localhost:8080/api/users/login";
                      var response = await userservice.login(url, {
                        "email": _emailController.text,
                        "password": _passwordController.text
                      });
                      if (response.isNotEmpty) {
                        var user = response.first;
                        Provider.of<Loginstatusprovider>(context, listen: false)
                            .changeLoginStatus(true);

                        Provider.of<Userprovider>(context, listen: false)
                            .setUser(user);
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "Login gagal. Periksa kembali kredensial Anda.")),
                        );
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(helper.colorFromHex("#F6F4F0"))),
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
                  "Belum punya akun?",
                  style: TextStyle(fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                          color: Color(helper.colorFromHex('#2E5077')),
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
