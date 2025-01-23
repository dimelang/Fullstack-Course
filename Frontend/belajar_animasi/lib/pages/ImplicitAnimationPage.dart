import 'package:flutter/material.dart';

class Implicitanimationpage extends StatefulWidget {
  const Implicitanimationpage({super.key});

  @override
  State<Implicitanimationpage> createState() => _ImplicitanimationpageState();
}

class _ImplicitanimationpageState extends State<Implicitanimationpage> {
  Color _beginColor = Colors.black;
  Color _endColor = Colors.red;
  void _changeColor() {
    setState(() {
      final temp = _beginColor;
      _beginColor = _endColor;
      _endColor = temp;
    });
  }

  BorderRadius _beginRadius = BorderRadius.circular(0);
  BorderRadius _endRadius = BorderRadius.circular(40);
  void _changeRadius() {
    setState(() {
      final temp = _beginRadius;
      _beginRadius = _endRadius;
      _endRadius = temp;
    });
  }

  double _opacity = 0;

  double _widthContainer = 100;
  double _heightContainer = 100;
  BoxDecoration _containerDecoration =
      BoxDecoration(borderRadius: BorderRadius.zero, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Implicit Animation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text("TweenAnimationBuilder"),
              ElevatedButton(
                  onPressed: () => _changeColor(), child: Text("Change Color")),
              TweenAnimationBuilder(
                tween: ColorTween(begin: _beginColor, end: _endColor),
                duration: Duration(seconds: 1),
                builder: (context, value, child) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: value,
                  );
                },
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text("TweenAnimationBuilder"),
              ElevatedButton(
                  onPressed: () => _changeRadius(),
                  child: Text("Change Border Radius")),
              TweenAnimationBuilder(
                tween: BorderRadiusTween(begin: _beginRadius, end: _endRadius),
                duration: Duration(seconds: 1),
                builder: (context, value, child) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration:
                        BoxDecoration(borderRadius: value, color: Colors.blue),
                  );
                },
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text("AnimatedOpacity"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _opacity = _opacity == 0 ? 1 : 0;
                    });
                  },
                  child: Text("Change Opacity")),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text("AnimatedContainer"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _widthContainer = _widthContainer == 200 ? 100 : 200;
                      _heightContainer = _heightContainer == 200 ? 100 : 200;
                      _containerDecoration = BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.yellow);
                    });
                  },
                  child: Text("Change Container Style")),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _widthContainer,
                height: _heightContainer,
                decoration: _containerDecoration,
              )
            ],
          ),
        ],
      ),
    );
  }
}
