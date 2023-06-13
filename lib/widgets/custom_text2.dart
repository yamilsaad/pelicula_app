import 'package:flutter/material.dart';

class CustomTextWidget2 extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CustomTextWidget2({
    Key? key,
    required this.text,
    this.style = const TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
