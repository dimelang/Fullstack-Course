import 'package:belajar_state_management_provider/providers/Counter.dart';
import 'package:belajar_state_management_provider/widgets/ThemeChangerButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Themechangerbutton(),
      body: Center(
        child: Text(
          Provider.of<Counter>(context).getCounterValue().toString(),
          style: TextStyle(color: Colors.blue, fontSize: 24),
        ),
      ),
    );
  }
}
