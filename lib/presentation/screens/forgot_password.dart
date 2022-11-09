import 'package:firebase_auth_demo/data/constants/constants.dart';
import 'package:firebase_auth_demo/presentation/utils.dart';
import 'package:firebase_auth_demo/presentation/widgets/clickable_Text.dart';
import 'package:firebase_auth_demo/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/dropdown_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/text_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/page_title.dart';
import 'package:flutter/material.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageTitle(title: Constants.forgotPasswordH),
        const Text(Constants.forgotPasswordPageText),
        sized(h: 30),
        const CustomTextInputField(
          label: 'Email',
          isRequired: true,
        ),
        sized(h: 15),
        CustomButton(onPressed: () {}, label: Constants.continuee),
        sized(h: 20),
        ClickableText(onPressed: () {}, text: Constants.cancel),
        spacer(),
      ],
    );
  }
}
