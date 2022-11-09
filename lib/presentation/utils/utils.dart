import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

sized({double? h, double? w}) => SizedBox(
      height: h ?? 0,
      width: w ?? 0,
    );

spacer() => const Spacer();
