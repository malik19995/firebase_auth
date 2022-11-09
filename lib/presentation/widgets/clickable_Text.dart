import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const ClickableText({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
