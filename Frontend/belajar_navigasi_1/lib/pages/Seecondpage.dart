import 'package:belajar_navigasi_1/pages/Thirdpage.dart';
import 'package:flutter/material.dart';

class Seecondpage extends StatefulWidget {
  final String title;
  final Widget content;
  const Seecondpage({super.key, required this.title, required this.content});

  @override
  State<Seecondpage> createState() => _SeecondpageState();
}

class _SeecondpageState extends State<Seecondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            widget.content,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: Text("Kembali"),
                  icon: Icon(Icons.arrow_back),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Thirdpage();
                      },
                    ));
                  },
                  label: Text("Masuk"),
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
