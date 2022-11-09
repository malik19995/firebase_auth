import 'package:firebase_auth_demo/data/constants/colors.dart';
import 'package:firebase_auth_demo/data/mixins/validation_mixin.dart';
import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  final List<DropdownMenuItem<Object>> items;
  final String label;
  final Function(Object?)? onChanged;
  const CustomDropDownField({
    super.key,
    required this.items,
    this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Object>(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintText: label,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.secondaryText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
      items: items,
      onChanged: onChanged,
      validator: (v) => ValidationsMixin.isNotEmpty(v.toString()),
    );
  }
}
