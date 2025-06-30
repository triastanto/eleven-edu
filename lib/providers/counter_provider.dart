import 'package:flutter/material.dart';
import '../models/counter_model.dart';

class CounterProvider extends ChangeNotifier {
  final CounterModel _counter = CounterModel(0);

  int get value => _counter.value;

  void increment() {
    _counter.value++;
    notifyListeners();
  }
}
