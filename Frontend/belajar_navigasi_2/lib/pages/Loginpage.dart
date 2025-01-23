import 'package:belajar_navigasi_2/helper/Helper.dart';
import 'package:belajar_navigasi_2/provider/AuthProvider.dart';
import 'package:belajar_navigasi_2/widgets/Headsection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final Helper helper = Helper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(helper.colorFromHex('#2E5077')),
      ),
      body: Column(
        children: [
          Headsection(
              title_page: "Login", desc_page: "Masuk untuk memulai sesi"),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Provider.of<Authprovider>(context, listen: false)
                            .changeAuthStatus();
                        context.go('/home');
                      },
                      label: Text("Masuk"),
                      icon: Icon(Icons.home),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.go('/register');
                      },
                      label: Text("Register"),
                      icon: Icon(Icons.app_registration_rounded),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
