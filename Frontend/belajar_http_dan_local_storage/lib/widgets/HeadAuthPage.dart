import 'package:belajar_http_dan_local_storage/helper/Helper.dart';
import 'package:flutter/material.dart';

class Headauthpage extends StatelessWidget {
  const Headauthpage({super.key});

  @override
  Widget build(BuildContext context) {
    final Helper helpers = Helper();
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
        height: screenHeight * 0.2,
        child: Container(
          height: 120,
          width: double.infinity,
          color: Color(helpers.colorFromHex("#2E5077")),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Text(
                  "Login",
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
                  "Masuk untuk memulai sesi",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ));
  }
}
