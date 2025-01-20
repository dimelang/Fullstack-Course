import 'package:belajar_input_widgets/widgets/CheckBoxWidget.dart';
import 'package:belajar_input_widgets/widgets/DropdownWidget.dart';
import 'package:belajar_input_widgets/widgets/FormWidget.dart';
import 'package:belajar_input_widgets/widgets/RadioWidget.dart';
import 'package:belajar_input_widgets/widgets/SliderWidget.dart';
import 'package:belajar_input_widgets/widgets/SwitchWidget.dart';
import 'package:belajar_input_widgets/widgets/TextInputWidget.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Textinputwidget(),
            Checkboxwidget(),
            Radiowidget(),
            Switchwidget(),
            Sliderwidget(),
            Dropdownwidget(),
            Formwidget()
          ],
        ),
      ),
    );
  }
}
