import 'package:firebase_auth_demo/data/constants/colors.dart';
import 'package:firebase_auth_demo/data/repository/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:logger/logger.dart';

final logger = Logger();

sized({double? h, double? w}) => SizedBox(
      height: h ?? 0,
      width: w ?? 0,
    );

spacer() => const Spacer();

String handleException(dynamic error) {
  String errormsg;
  if (error.runtimeType == CustomException) {
    errormsg = (error as CustomException).error.toString();
  } else {
    errormsg = error.toString();
  }
  if (errormsg.contains('email-already-in-use')) {
    return 'Email already in use. Please login or try a different email';
  } else if (errormsg.contains('invalid-email')) {
    return 'Invalid Email. Please try a different email';
  } else if (errormsg.contains('weak-password')) {
    return 'Weak Password. Please select a stronger password.';
  } else if (errormsg.contains('user-not-found')) {
    return 'User not found, verify account credentials.';
  } else if (errormsg.contains('wrong-password')) {
    return 'Invalid Password. Please try again.';
  } else if (errormsg.contains('user-disabled')) {
    return 'This user is blocked!';
  }

  return 'Error Occurred. Please try again.';
}

setStatusBarColors() {
  FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryColor);
  FlutterStatusbarcolor.setNavigationBarColor(AppColors.primaryColor);
}
