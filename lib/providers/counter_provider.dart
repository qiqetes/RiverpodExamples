import 'dart:developer';

import 'package:riverpod_examples/modesls/counter.dart';
import 'package:riverpod_examples/repositories/fake_counter_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState extends StateNotifier<Counter> {
  CounterState() : super(Counter(0, CounterStateType.loaded));

  void increment() async {
    state = Counter(state.count, CounterStateType.loading);

    try {
      int plusCounter = await FakeCounterRepo.getPlusCounter();
      state = Counter(state.count + plusCounter, CounterStateType.loaded);
    } catch (e) {
      state = Counter(state.count, CounterStateType.failed);
    }
  }
}

final counterProvider =
    StateNotifierProvider.autoDispose<CounterState, Counter>((ref) {
  ref.onDispose(() {
    log("disposing");
  });

  return CounterState();
});
