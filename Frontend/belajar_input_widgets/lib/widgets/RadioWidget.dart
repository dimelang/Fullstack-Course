import 'package:flutter/material.dart';

class Radiowidget extends StatefulWidget {
  const Radiowidget({super.key});

  @override
  State<Radiowidget> createState() => _RadiowidgetState();
}

class _RadiowidgetState extends State<Radiowidget> {
  String? _selected_option;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Radio(
              activeColor: Colors.blue,
              hoverColor: Colors.blue.shade500.withOpacity(0.2),
              value: 'Pria',
              groupValue: _selected_option,
              onChanged: (value) {
                setState(() {
                  _selected_option = value;
                });
              }),
          Text('Pria'),
          Radio(
              activeColor: Colors.pink,
              hoverColor: Colors.pink.shade500.withOpacity(0.2),
              value: 'Wanita',
              groupValue: _selected_option,
              onChanged: (value) {
                setState(() {
                  _selected_option = value;
                });
              }),
          Text('Wanita')
        ],
      ),
    );
  }
}
