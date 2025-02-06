import 'package:belajar_integrasi_firebase/helper/Helper.dart';
import 'package:belajar_integrasi_firebase/pages/Homepage.dart';
import 'package:belajar_integrasi_firebase/pages/Registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isHidden = true;
  final helper = Helper();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      User? user = userCredential.user;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berhasil login'),
          backgroundColor: Colors.greenAccent,
        ),
      );

      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Homepage(user: user);
        },
      ));
    } on FirebaseAuthException catch (e) {
      String msg;
      if (e.code == 'user-not-found') {
        msg = "Akun tidak ditemukan. Silakan daftar terlebih dahulu.";
      } else if (e.code == 'wrong-password') {
        msg = "Kata sandi salah. Silakan coba lagi.";
      } else if (e.code == 'invalid-email') {
        msg = "Format email tidak valid.";
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
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign in.",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
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
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return "Password wajib diisi";
                    }
                    return null;
                  },
                  obscureText: _isHidden ? true : false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isHidden = !_isHidden;
                            });
                          },
                          icon: Icon(_isHidden
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      hintText: 'Password',
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
                        if (formKey.currentState!.validate()) {
                          login();
                        }
                      },
                      child: Center(
                        child: Text(
                          'SIGN IN',
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
                  Text("Belum punya akun?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return Registerpage();
                          },
                        ));
                      },
                      child: Text("Register"))
                ])
              ],
            )),
      ),
    );
  }
}
