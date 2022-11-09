import 'package:firebase_auth_demo/data/constants/constants.dart';
import 'package:firebase_auth_demo/presentation/utils.dart';
import 'package:firebase_auth_demo/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/dropdown_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/text_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/page_title.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Column(
      children: [
        const PageTitle(title: Constants.signupPageTitle),
        sized(h: 30),
        const CustomTextInputField(
          label: 'Name',
          isRequired: true,
        ),
        CustomDropDownField(
          items: List.generate(120, (index) {
            int value = currentYear - index;
            return DropdownMenuItem(
              value: value.toString(),
              child: Text(
                value.toString(),
              ),
            );
          }),
          onChanged: (p0) {},
        ),
        CustomDropDownField(
          items: const [
            DropdownMenuItem(
              value: 'male',
              child: Text('Male'),
            ),
            DropdownMenuItem(
              value: 'female',
              child: Text(
                'Female',
              ),
            ),
          ],
          onChanged: (p0) {},
        ),
        const CustomTextInputField(
          label: 'Email',
          isRequired: true,
        ),
        const CustomTextInputField(
          label: 'Password',
          isRequired: true,
        ),
        const CustomTextInputField(
          label: 'Confirm Password',
          isRequired: true,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (v) {},
          title: const Text(Constants.termsAccept),
        ),
        sized(h: 20),
        CustomButton(
          label: 'Save',
          onPressed: () {},
        ),
        sized(h: 20),
        Row(
          children: [
            const Text(Constants.alreadyAUser),
            InkWell(
              onTap: () {},
              child: const Text(Constants.login),
            ),
          ],
        )
      ],
    );
  }
}
