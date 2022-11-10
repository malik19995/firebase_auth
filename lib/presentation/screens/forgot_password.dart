import 'package:firebase_auth_demo/data/constants/colors.dart';
import 'package:firebase_auth_demo/data/constants/constants.dart';
import 'package:firebase_auth_demo/data/mixins/validation_mixin.dart';
import 'package:firebase_auth_demo/data/navigator/navigator.dart';
import 'package:firebase_auth_demo/domain/cubits/authentication_cubit.dart';
import 'package:firebase_auth_demo/presentation/utils/utils.dart';
import 'package:firebase_auth_demo/presentation/widgets/clickable_Text.dart';
import 'package:firebase_auth_demo/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/dropdown_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/text_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  String? email;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              spacer(),
              const PageTitle(title: Constants.forgotPasswordH),
              sized(h: 12),
              Text(Constants.forgotPasswordPageText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromARGB(255, 134, 120, 155),
                      fontSize: 16,
                      wordSpacing: 1.2)),
              sized(h: 30),
              CustomTextInputField(
                label: 'Email',
                isRequired: true,
                initialValue: email ?? '',
                validator: (s) => ValidationsMixin.isEmailValid(s),
                onChanged: (s) {
                  setState(() {
                    email = s;
                  });
                },
              ),
              sized(h: 15),
              CustomButton(
                  onPressed: () {
                    var form = formKey.currentState;

                    if (form!.validate()) {
                      form.save();
                      context
                          .read<AuthenticationCubit>()
                          .forgotPassword(email!)
                          .then((value) {
                        if (value) {
                          Fluttertoast.showToast(
                              msg: 'Reset Email sent successfully');
                        } else {}
                      });
                    }
                  },
                  label: Constants.continuee),
              sized(h: 20),
              CustomButton(
                onPressed: () {
                  navigateBack(context);
                },
                label: Constants.cancel,
                backgroundColor: AppColors.secondaryColor,
              ),
              spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
