import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  const Textwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
        child: Text(
          "Hello world!",
          maxLines: 3,
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              letterSpacing: 3,
              wordSpacing: 2),
        ),
      )),
    );
  }
}
