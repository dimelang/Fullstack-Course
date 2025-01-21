import 'dart:convert';

import 'package:belajar_http_dan_local_storage/model/User/UserGetRequest.dart';
import 'package:belajar_http_dan_local_storage/service/SharedPreferencesService.dart';
import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier {
  Usergetrequest? _user;

  Usergetrequest? getUser() {
    return _user;
  }

  void setUser(Usergetrequest user) {
    _user = user;
    _saveUserToPrefs(user);
    notifyListeners();
  }

  Future<void> _saveUserToPrefs(Usergetrequest user) async {
    final prefs = Sharedpreferencesservice();
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<void> loadUserFromPrefs() async {
    final prefs = Sharedpreferencesservice();
    final userJson = await prefs.getString('user');

    if (!userJson.isEmpty) {
      _user = Usergetrequest.fromJson(jsonDecode(userJson));
      notifyListeners();
    }
  }

  Future<void> removeUser() async {
    final prefs = Sharedpreferencesservice();
    await prefs.deleteData('user');
    loadUserFromPrefs();
  }
}
