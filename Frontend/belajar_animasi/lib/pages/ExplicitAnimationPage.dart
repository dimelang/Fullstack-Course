import 'package:flutter/material.dart';

class Explicitanimationpage extends StatefulWidget {
  const Explicitanimationpage({super.key});

  @override
  State<Explicitanimationpage> createState() => _ExplicitanimationpageState();
}

class _ExplicitanimationpageState extends State<Explicitanimationpage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _borderRadiusAnimation;
  late Animation<Color?> _colorAnimation;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat(reverse: true);
    _animation =
        Tween<double>(begin: 0.0, end: 300).animate(_animationController);
    _borderRadiusAnimation =
        Tween<double>(begin: 100, end: 0).animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(_animationController);
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explicit Animation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              width: _animation.value,
              height: _animation.value,
              decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius:
                      BorderRadius.circular(_borderRadiusAnimation.value)),
            );
          },
        ),
      ),
    );
  }
}
