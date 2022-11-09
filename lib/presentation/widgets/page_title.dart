import 'package:firebase_auth_demo/data/constants/colors.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3!.copyWith(
            color: AppColors.primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
