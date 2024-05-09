import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int count = 0;

  void increment() {
    count += 1;
    notifyListeners();
  }

  void decrement() {
    count -= 1;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }

  void printCounter() {
    print(count);
  }
}
