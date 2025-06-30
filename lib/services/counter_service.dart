import '../models/counter_model.dart';

class CounterService {
  CounterModel counter = CounterModel(0);

  void increment() {
    counter.value++;
  }
}
