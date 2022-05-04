import 'package:hooks_riverpod/hooks_riverpod.dart';

final changeIndexProvider = StateNotifierProvider<ChangeIndexNotifier, int>((ref) {
  return ChangeIndexNotifier();
});

class ChangeIndexNotifier extends StateNotifier<int> {
  ChangeIndexNotifier(): super(1);

  void setState(int value) {
    if(state != value) {
      state = value;
    }
  }
}