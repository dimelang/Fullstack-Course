import 'package:flutter/material.dart';

class Dragpage extends StatefulWidget {
  const Dragpage({super.key});

  @override
  State<Dragpage> createState() => _DragpageState();
}

class _DragpageState extends State<Dragpage> {
  Offset _position = Offset(0, 0);
  bool _isDrag = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          left: _position.dx,
          top: _position.dy,
          child: GestureDetector(
            onVerticalDragStart: (details) {
              setState(() {
                _isDrag = true;
              });
            },
            onHorizontalDragStart: (details) {
              setState(() {
                _isDrag = true;
              });
            },
            onVerticalDragUpdate: (details) {
              setState(() {
                _position += details.delta;
              });
            },
            onHorizontalDragUpdate: (details) {
              setState(() {
                _position += details.delta;
              });
            },
            onVerticalDragEnd: (details) {
              setState(() {
                _isDrag = false;
              });
            },
            onHorizontalDragEnd: (details) {
              setState(() {
                _isDrag = false;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              color: _isDrag ? Colors.greenAccent : Colors.redAccent,
              alignment: Alignment.center,
              child: Text(
                'Drag me!',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ))
    ]);
  }
}
