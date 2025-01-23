import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  final String id;
  const Detailpage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Product ${id}",
              style: TextStyle(color: Colors.blue, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
