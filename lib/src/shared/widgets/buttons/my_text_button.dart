import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final ButtonStyle? textButtonStyle;

  const MyTextButton(
      {required this.text,
      required this.onPressed,
      this.textStyle,
      this.textButtonStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: textButtonStyle,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
