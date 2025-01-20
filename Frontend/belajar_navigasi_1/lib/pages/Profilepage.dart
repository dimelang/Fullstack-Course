import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  final String title;
  final int id;
  const Profilepage({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "User Id: $id",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text('Kembali'),
              icon: Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
    );
  }
}
