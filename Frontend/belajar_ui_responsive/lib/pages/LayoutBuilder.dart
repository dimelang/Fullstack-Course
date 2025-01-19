import 'package:belajar_ui_responsive/widgets/DesktopWidget.dart';
import 'package:belajar_ui_responsive/widgets/MobileWidget.dart';
import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Desktopwidget();
          } else {
            return Mobilewidget();
          }
        },
      ),
    );
  }
}
