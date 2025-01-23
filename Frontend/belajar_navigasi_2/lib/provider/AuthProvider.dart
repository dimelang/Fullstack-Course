import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  bool _isAuth = false;

  void changeAuthStatus() {
    _isAuth = true;
    notifyListeners();
  }

  bool getAuthStatus() {
    return _isAuth;
  }
}
