import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String title;
  final Widget content;
  const Homepage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              content,
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/second-page');
                },
                label: Text("Masuk"),
                icon: Icon(Icons.door_front_door),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile',
                      arguments: {'title': 'Halaman Profil', 'id': 1});
                },
                label: Text("Profil"),
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ));
  }
}
