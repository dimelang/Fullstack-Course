import 'package:belajar_widget_dasar/pages/ButtonWidget.dart';
import 'package:belajar_widget_dasar/pages/ImageWidget.dart';
import 'package:belajar_widget_dasar/pages/LayoutWidget.dart';
import 'package:belajar_widget_dasar/pages/ScaffoldWidget.dart';
import 'package:belajar_widget_dasar/pages/TextWidget.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Textwidget();
                    },
                  ));
                },
                child: Text("Text Widget")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Imagewidget();
                    },
                  ));
                },
                child: Text("Images Widget")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Buttonwidget();
                    },
                  ));
                },
                child: Text("Button Widget")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Scaffoldwidget();
                    },
                  ));
                },
                child: Text("Scaffold Widget")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Layoutwidget();
                    },
                  ));
                },
                child: Text("Layout Widget")),
          ],
        ),
      ),
    );
  }
}
