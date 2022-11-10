import 'package:firebase_auth_demo/data/constants/colors.dart';
import 'package:firebase_auth_demo/data/constants/constants.dart';
import 'package:firebase_auth_demo/data/mixins/validation_mixin.dart';
import 'package:firebase_auth_demo/data/navigator/navigator.dart';
import 'package:firebase_auth_demo/data/repository/authenticator.dart';
import 'package:firebase_auth_demo/domain/cubits/authentication_cubit.dart';
import 'package:firebase_auth_demo/presentation/screens/forgot_password.dart';
import 'package:firebase_auth_demo/presentation/screens/signup_view.dart';
import 'package:firebase_auth_demo/presentation/utils/utils.dart';
import 'package:firebase_auth_demo/presentation/widgets/clickable_Text.dart';
import 'package:firebase_auth_demo/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/text_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: loadingNotifier,
          builder: (context, isLoading, _) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      spacer(),
                      const PageTitle(
                        title: Constants.logIn,
                      ),
                      sized(h: 30),
                      CustomTextInputField(
                        initialValue: email,
                        label: 'Email',
                        validator: (p0) => ValidationsMixin.isEmailValid(p0),
                        isRequired: true,
                        onChanged: (s) {
                          setState(() {
                            email = s;
                          });
                        },
                      ),
                      sized(h: 8),
                      CustomTextInputField(
                        initialValue: password,
                        label: 'Password',
                        obscureText: true,
                        validator: (p0) => ValidationsMixin.isPasswordValid(p0),
                        isRequired: true,
                        onChanged: (s) {
                          setState(() {
                            password = s;
                          });
                        },
                      ),
                      sized(h: 15),
                      CustomButton(
                          onPressed: () {
                            var form = formKey.currentState;

                            if (form!.validate()) {
                              form.save();
                              loadingNotifier.value = true;
                              context
                                  .read<AuthenticationCubit>()
                                  .login(email, password)
                                  .then((value) {
                                loadingNotifier.value = false;
                              }).catchError((err, s) {
                                CustomException ex = err;
                                loadingNotifier.value = false;
                                logger.e(ex.error.toString());
                                logger.e(s);
                                Fluttertoast.showToast(
                                  msg: handleException(err),
                                );
                              });
                            } else {
                              Fluttertoast.showToast(msg: 'Invalid form');
                            }
                          },
                          label: Constants.letsgo),
                      ClickableText(
                        onPressed: () {
                          navigateTo(
                            context,
                            const ForgotForm(),
                          );
                        },
                        text: Constants.forgotPassword,
                        foregroundColor: AppColors.secondaryText,
                      ),
                      spacer(),
                      ClickableText(
                        text: Constants.dontHaveAccount,
                        onPressed: () {},
                        foregroundColor: AppColors.primaryColor,
                      ),
                      CustomButton(
                        onPressed: () {
                          navigateTo(context, const SignupForm());
                        },
                        label: Constants.register,
                      ),
                      spacer(),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
