import 'package:flutter_test/flutter_test.dart';
import 'package:elevenedu_school/providers/counter_provider.dart';

void main() {
  group('CounterProvider', () {
    test('initial value is 0', () {
      final provider = CounterProvider();
      expect(provider.value, 0);
    });

    test('increment increases value by 1', () {
      final provider = CounterProvider();
      provider.increment();
      expect(provider.value, 1);
    });
  });
}
