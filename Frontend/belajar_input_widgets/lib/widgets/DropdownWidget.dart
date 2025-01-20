import 'package:flutter/material.dart';

class Dropdownwidget extends StatefulWidget {
  const Dropdownwidget({super.key});

  @override
  State<Dropdownwidget> createState() => _DropdownwidgetState();
}

class _DropdownwidgetState extends State<Dropdownwidget> {
  final List<String> _items = List<String>.generate(10, (i) => 'Item ${i + 1}');
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue, width: 1.5)),
          child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: _selectedItem,
                  icon: Icon(Icons.arrow_downward),
                  hint: Text('Pilih item'),
                  items: _items.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  })),
        ));
  }
}
