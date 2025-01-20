import 'package:flutter/material.dart';

class Themechanger extends ChangeNotifier {
  bool _is_light = true;

  bool themeIsLight() {
    return _is_light;
  }

  void changeTheme() {
    _is_light = !_is_light;
    notifyListeners();
  }
}
