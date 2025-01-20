import 'package:flutter/material.dart';

class Sliderwidget extends StatefulWidget {
  const Sliderwidget({super.key});

  @override
  State<Sliderwidget> createState() => _SliderwidgetState();
}

class _SliderwidgetState extends State<Sliderwidget> {
  double _slideValue = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Slider(
        min: 0,
        max: 100,
        divisions: 100,
        label: _slideValue.round().toString(),
        activeColor: Colors.blue,
        value: _slideValue,
        onChanged: (value) {
          setState(() {
            _slideValue = value;
          });
        },
      ),
    );
  }
}
