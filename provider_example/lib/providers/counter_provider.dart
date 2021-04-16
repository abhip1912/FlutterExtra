import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;

  void incrementCounter() {
    _counter += 1;
    notifyListeners();
  }

  void decrementCounter() {
    _counter -= 1;
    notifyListeners();
  }

  int get getCounter {
    return _counter;
  }
}
