import 'package:flutter/material.dart';

class Switchwidget extends StatefulWidget {
  const Switchwidget({super.key});

  @override
  State<Switchwidget> createState() => _SwitchwidgetState();
}

class _SwitchwidgetState extends State<Switchwidget> {
  bool _status = false;

  final WidgetStateProperty<Color?> overlayColor =
      WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
    WidgetState.selected: Colors.amber.withOpacity(0.54),
    WidgetState.disabled: Colors.grey.shade400
  });

  final WidgetStateProperty<Color?> trackColor =
      WidgetStateProperty<Color?>.fromMap(
          <WidgetState, Color>{WidgetState.selected: Colors.amber});

  final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty<Icon?>.fromMap(<WidgetStatesConstraint, Icon>{
    WidgetState.selected: Icon(
      Icons.check,
      color: Colors.white,
    ),
    WidgetState.any: Icon(
      Icons.close,
      color: Colors.grey.shade700,
    )
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Switch(
            overlayColor: overlayColor,
            trackColor: trackColor,
            thumbColor: WidgetStatePropertyAll(Colors.black),
            thumbIcon: thumbIcon,
            value: _status,
            onChanged: (bool value) {
              setState(() {
                _status = value;
              });
            }));
  }
}
