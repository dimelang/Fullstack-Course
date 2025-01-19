import 'package:flutter/material.dart';

class Mobilewidget extends StatelessWidget {
  const Mobilewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        spacing: 5,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.green,
                child: Text(
                  "Navbar",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                color: Colors.orange,
                child: Text(
                  "Main",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.pink,
                child: Text(
                  "Content 1",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.pink,
                child: Text(
                  "Content 2",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.pink,
                child: Text(
                  "Content 3",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.purple,
                child: Text(
                  "Footer",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
