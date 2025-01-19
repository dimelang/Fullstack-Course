import 'package:belajar_ui_responsive/widgets/DesktopWidget.dart';
import 'package:belajar_ui_responsive/widgets/MobileWidget.dart';
import 'package:flutter/material.dart';

class MediaQueryWidget extends StatelessWidget {
  const MediaQueryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: _screenWidth > 600 ? Desktopwidget() : Mobilewidget());
  }
}
