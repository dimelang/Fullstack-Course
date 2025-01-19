import 'package:flutter/material.dart';

class Tappage extends StatefulWidget {
  const Tappage({super.key});

  @override
  State<Tappage> createState() => _TappageState();
}

class _TappageState extends State<Tappage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _counter++;
          });
        },
        child: Scaffold(
          body: Center(
            child: Text(
              "Jumlah tap: $_counter",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ));
  }
}
