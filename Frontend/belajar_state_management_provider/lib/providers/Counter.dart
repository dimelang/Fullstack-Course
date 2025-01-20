import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  int getCounterValue() {
    return _count;
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
