import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? foregroundColor;
  const ClickableText(
      {super.key, this.onPressed, required this.text, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
      ),
      child: Text(text),
    );
  }
}
