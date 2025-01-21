import 'package:belajar_http_dan_local_storage/service/SharedPreferencesService.dart';
import 'package:flutter/material.dart';

class Loginstatusprovider extends ChangeNotifier {
  bool _isLogin = false;

  bool loginStatus() {
    return _isLogin;
  }

  Future<void> changeLoginStatus(bool newStatus) async {
    _isLogin = newStatus;
    final prefs = Sharedpreferencesservice();
    prefs.setBool('login', _isLogin);
    notifyListeners();
  }

  Future<void> loadLoginStatus() async {
    final prefs = Sharedpreferencesservice();
    _isLogin = await prefs.getBool('login');
    notifyListeners();
  }

  Future<void> removeLoginStatus() async {
    final prefs = Sharedpreferencesservice();
    await prefs.deleteData('login');
    loadLoginStatus();
  }
}
