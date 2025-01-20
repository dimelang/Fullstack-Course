import 'package:belajar_state_management_provider/providers/ThemeChanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Themechangerbutton extends StatelessWidget {
  const Themechangerbutton({super.key});

  @override
  Widget build(BuildContext context) {
    Themechanger themeProvider = Provider.of<Themechanger>(context);
    return FloatingActionButton(
      child:
          Icon(themeProvider.themeIsLight() ? Icons.nightlight : Icons.sunny),
      onPressed: () {
        themeProvider.changeTheme();
      },
    );
  }
}
