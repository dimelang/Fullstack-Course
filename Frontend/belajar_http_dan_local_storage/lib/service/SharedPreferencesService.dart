import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferencesservice {
  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 9999;
  }

  Future<void> setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<double> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? double.infinity;
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<void> setList(String key, List<dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    final listData = value.map(
      (e) {
        return jsonEncode(e);
      },
    ).toList();
    prefs.setStringList(key, listData);
  }

  Future<List<dynamic>> getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = prefs.getStringList(key) ?? [];
    return dataList.map((e) => jsonDecode(e)).toList();
  }

  Future<void> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
