import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  const CustomDropDownField({super.key, required this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: items,
      onChanged: onChanged,
    );
  }
}
