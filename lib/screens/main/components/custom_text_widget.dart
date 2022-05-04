import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  double padding;
  Color color;
  FontWeight fontWeight;
  double fontSize;

  CustomTextWidget({
    Key? key,
    this.text = '',
    this.padding = 8,
    this.color = const Color.fromARGB(255, 61, 61, 61),
    this.fontWeight = FontWeight.w400,
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
