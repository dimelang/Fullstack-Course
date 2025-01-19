import 'package:flutter/material.dart';

class Buttonwidget extends StatelessWidget {
  const Buttonwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                print("ElevatedButton pressed!");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text('ElevatedButton'),
            ),
            FloatingActionButton(
              onPressed: () {
                print("FloatingActionButton pressed!");
              },
              elevation: 5,
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              hoverColor: Colors.blue.shade400,
              hoverElevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              // tooltip: 'Floating Action Button',
              child: Text("FAB"),
            ),
            TextButton(
                onPressed: () {
                  print("TextButton pressed!");
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.blue, padding: EdgeInsets.all(10)),
                child: Text("TextButton")),
            IconButton(
              onPressed: () {
                print("IconButton pressed!");
              },
              icon: Icon(Icons.check),
              color: Colors.blue,
              tooltip: 'IconButton',
              hoverColor: Colors.blue.shade100,
              highlightColor: Colors.blue.shade300,
            )
          ],
        ),
      ),
    );
  }
}
