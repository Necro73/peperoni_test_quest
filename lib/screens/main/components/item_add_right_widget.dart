import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peperoni_test_quest/logic/change/change_item_count_notifier.dart';

class ItemAddRightWidget extends ConsumerWidget {
  WidgetRef parentRef;
  int price;
  bool isSmall;
  int index = 0;

  ItemAddRightWidget({
    Key? key,
    required this.parentRef,
    this.price = 0,
    this.isSmall = true,
  }) : super(key: key) {
    index = parentRef.read(changeItemCountProvider.notifier).state.length;
    parentRef.read(changeItemCountProvider.notifier).state.add(0);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChangeItemCountNotifier changeItemCountRead = ref.read(changeItemCountProvider.notifier);
    List<int> changeItemCountWatch = ref.watch(changeItemCountProvider.select((value) => value));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        width: isSmall ? 88 : 128,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (changeItemCountRead.state[index] == 0) {
                    changeItemCountRead.increment(index);
                  } else {
                    changeItemCountRead.decrement(index);
                  }
                },
                child: Container(
                  width: 23,
                  height: 23,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      color: (changeItemCountWatch[index] == 0) ? const Color.fromARGB(255, 230, 230, 240) : Colors.white,
                      border: Border.all(color: const Color.fromARGB(255, 230, 230, 240))

                      ///#E6E6F0
                      ),
                  child: Text((changeItemCountWatch[index] == 0) ? '+' : '-'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text((changeItemCountWatch[index] == 0) ? '$price ₽' : '${changeItemCountWatch[index]}'),
              ),
              (changeItemCountWatch[index] > 0)
                  ? GestureDetector(
                      onTap: () {
                        changeItemCountRead.increment(index);
                      },
                      child: Container(
                        width: 23,
                        height: 23,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(40)),
                            color: Colors.white,
                            border: Border.all(color: const Color.fromARGB(255, 220, 94, 73))

                            ///#DC5E49
                            ),
                        child: const Text('+', style: TextStyle(color: Color.fromARGB(255, 220, 94, 73))),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
