import 'package:firebase_auth_demo/data/constants/constants.dart';
import 'package:firebase_auth_demo/presentation/utils.dart';
import 'package:firebase_auth_demo/presentation/widgets/clickable_Text.dart';
import 'package:firebase_auth_demo/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/dropdown_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/text_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/page_title.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageTitle(
          title: Constants.logIn,
        ),
        sized(h: 30),
        const CustomTextInputField(
          label: 'Email',
          isRequired: true,
        ),
        const CustomTextInputField(
          label: 'Password',
          isRequired: true,
        ),
        sized(h: 15),
        CustomButton(onPressed: () {}, label: Constants.letsgo),
        sized(h: 20),
        ClickableText(onPressed: () {}, text: Constants.forgotPassword),
        spacer(),
        ClickableText(
          text: Constants.dontHaveAccount,
          onPressed: () {},
        ),
        CustomButton(onPressed: () {}, label: Constants.register)
      ],
    );
  }
}
