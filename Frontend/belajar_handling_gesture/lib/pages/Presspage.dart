import 'package:flutter/material.dart';

class Presspage extends StatefulWidget {
  const Presspage({super.key});

  @override
  State<Presspage> createState() => _PresspageState();
}

class _PresspageState extends State<Presspage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _counter++;
        });
      },
      child: Material(
        child: Container(
          width: 300,
          height: 300,
          alignment: Alignment.center,
          color: Colors.red,
          child: Text(
            "Jumlah long press: $_counter",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
