import 'package:belajar_integrasi_firebase/helper/Helper.dart';
import 'package:belajar_integrasi_firebase/pages/Loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;
  final helper = Helper();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  Future<void> register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      User? user = userCredential.user;
      await user?.updateDisplayName(_usernameController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berhasil register. Silahkan login'),
          backgroundColor: Colors.greenAccent,
        ),
      );
    } on FirebaseAuthException catch (e) {
      var msg = "Terjadi kesalahan";
      if (e.code == 'weak-password') {
        msg = "Kata sandi terlalu lemah";
      } else if (e.code == 'email-already-in-use') {
        msg = "Email sudah terdaftar";
      } else if (e.code == 'invalid-email') {
        msg = "Format email tidak valid";
      } else {
        msg = "Terjadi kesalahan: ${e.message}";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign up.",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return "Username wajib diisi";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return "Email wajib diisi";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return "Password wajib diisi";
                    }
                    if (value.length <= 5) {
                      return "Password setidaknya memiliki 6 karakter";
                    }
                    return null;
                  },
                  obscureText: _isHiddenPassword ? true : false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isHiddenPassword = !_isHiddenPassword;
                            });
                          },
                          icon: Icon(_isHiddenPassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return "Konfirmasi wajib diisi";
                    }

                    if (value != _passwordController.text) {
                      return "Password tidak cocok";
                    }
                    return null;
                  },
                  obscureText: _isHiddenConfirmPassword ? true : false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isHiddenConfirmPassword =
                                  !_isHiddenConfirmPassword;
                            });
                          },
                          icon: Icon(_isHiddenConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(helper.colorFromHex("#79D7BE")),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          register();
                        }
                      },
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(helper.colorFromHex("#F6F4F0"))),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Text("Sudah punya akun?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return Loginpage();
                          },
                        ));
                      },
                      child: Text("Login"))
                ])
              ],
            )),
      ),
    );
  }
}
