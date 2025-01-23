import 'package:belajar_animasi/pages/ExplicitAnimationPage.dart';
import 'package:belajar_animasi/pages/ImplicitAnimationPage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animation Apps Demo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Implicitanimationpage();
                    },
                  ));
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(
                    "Implicit Animation",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Explicitanimationpage();
                    },
                  ));
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(
                    "Explicit Animation",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
