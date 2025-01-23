import 'package:belajar_navigasi_2/helper/Helper.dart';
import 'package:belajar_navigasi_2/widgets/Headsection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
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
              title_page: "Register", desc_page: "Daftar untuk memulai sesi"),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  context.go('/');
                },
                label: Text("Kembali"),
                icon: Icon(Icons.arrow_back),
              )
            ],
          ))
        ],
      ),
    );
  }
}
