import 'package:flutter/material.dart';

class Doubletappage extends StatefulWidget {
  const Doubletappage({super.key});

  @override
  State<Doubletappage> createState() => _DoubletappageState();
}

class _DoubletappageState extends State<Doubletappage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _counter++;
        });
      },
      child: Scaffold(
        body: Center(
          child: Text("Jumlah double tap: $_counter",
              style: TextStyle(color: Colors.blue, fontSize: 20)),
        ),
      ),
    );
  }
}
