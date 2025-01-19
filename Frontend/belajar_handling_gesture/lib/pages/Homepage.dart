import 'package:belajar_handling_gesture/pages/DoubleTapPage.dart';
import 'package:belajar_handling_gesture/pages/DragPage.dart';
import 'package:belajar_handling_gesture/pages/PanPage.dart';
import 'package:belajar_handling_gesture/pages/Presspage.dart';
import 'package:belajar_handling_gesture/pages/TapPage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Tappage();
                    },
                  ));
                },
                child: Text("Tap Gesture")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Doubletappage();
                    },
                  ));
                },
                child: Text("Double Tap Gesture")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Presspage();
                    },
                  ));
                },
                child: Text("Press Gesture")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Dragpage();
                    },
                  ));
                },
                child: Text("Drag Gesture")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Panpage();
                    },
                  ));
                },
                child: Text("Pan Gesture")),
          ],
        ),
      ),
    );
  }
}
