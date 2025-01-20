import 'package:flutter/material.dart';

class Checkboxwidget extends StatefulWidget {
  const Checkboxwidget({super.key});

  @override
  State<Checkboxwidget> createState() => _CheckboxwidgetState();
}

class _CheckboxwidgetState extends State<Checkboxwidget> {
  bool _is_checked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Checkbox(
            value: _is_checked,
            onChanged: (bool? value) {
              setState(() {
                print('Is checked: $value');
                _is_checked = value!;
              });
            },
            activeColor: Colors.blue,
            checkColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
