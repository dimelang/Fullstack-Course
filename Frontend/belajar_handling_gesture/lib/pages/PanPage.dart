import 'package:flutter/material.dart';

class Panpage extends StatefulWidget {
  const Panpage({super.key});

  @override
  State<Panpage> createState() => _PanpageState();
}

class _PanpageState extends State<Panpage> {
  Offset _position = Offset(0, 0);
  bool _isPan = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: _position.dx,
            top: _position.dy,
            child: GestureDetector(
                onPanStart: (details) {
                  setState(() {
                    _isPan = true;
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    _position += details.delta;
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    _isPan = false;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  color: _isPan ? Colors.greenAccent : Colors.redAccent,
                  child: Text(
                    'Pan me',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )))
      ],
    );
  }
}
