import 'package:hooks_riverpod/hooks_riverpod.dart';

final changeItemCountProvider = StateNotifierProvider<ChangeItemCountNotifier, List<int>>((ref) {
  return ChangeItemCountNotifier();
});

class ChangeItemCountNotifier extends StateNotifier<List<int>> {
  ChangeItemCountNotifier(): super([]);

  void setState(List<int> value) {
    if(state != value) {
      state = value;
    }
  }

  void increment(int index) {
    if (state[index] < 99) {
      state[index]++;
      state = List.of(state.getRange(0, state.length));
    }
  }

  void decrement(int index) {
    state[index]--;
    state = List.of(state.getRange(0, state.length));
  }
}