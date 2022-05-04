import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peperoni_test_quest/logic/change/change_index_notifier.dart';

class ButtonSizeWidget extends StatelessWidget {
  String text;
  int number;
  WidgetRef parentRef;

  ButtonSizeWidget({
    Key? key,
    this.text = '',
    this.number = 0,
    required this.parentRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: GestureDetector(
        onTap: () {
          parentRef.read(changeIndexProvider.notifier).setState(number);
        },
        child: Container(
          width: 94,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            color: (parentRef.watch(changeIndexProvider.select((value) => value)) == number)
                ? const Color.fromARGB(255, 252, 254, 255)
                : const Color.fromARGB(255, 244, 244, 252),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
