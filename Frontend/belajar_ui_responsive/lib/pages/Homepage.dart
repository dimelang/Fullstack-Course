import 'package:belajar_ui_responsive/pages/LayoutBuilder.dart';
import 'package:belajar_ui_responsive/pages/MediaQuery.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MediaQueryWidget();
                  },
                ));
              },
              child: Text("MediaQuery")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LayoutBuilderWidget();
                  },
                ));
              },
              child: Text("LayoutBuilder")),
        ],
      ),
    ));
  }
}
