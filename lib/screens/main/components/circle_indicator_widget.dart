import 'package:flutter/material.dart';

class CircleIndicatorWidget extends StatelessWidget {
  Color color;

  CircleIndicatorWidget({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: color,
        ),
      ),
    );
  }
}
