import 'package:firebase_auth_demo/data/constants/colors.dart';
import 'package:firebase_auth_demo/data/constants/constants.dart';
import 'package:firebase_auth_demo/data/mixins/validation_mixin.dart';
import 'package:firebase_auth_demo/data/navigator/navigator.dart';
import 'package:firebase_auth_demo/domain/cubits/authentication_cubit.dart';
import 'package:firebase_auth_demo/presentation/utils/size_config.dart';
import 'package:firebase_auth_demo/presentation/utils/utils.dart';
import 'package:firebase_auth_demo/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/custom_checkbox.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/dropdown_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/input_fields/text_field.dart';
import 'package:firebase_auth_demo/presentation/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> with ValidationsMixin {
  String? name, email, gender;
  int year = 2022;
  String? password, cPassword;
  String errorText = '';
  bool termsAccepted = false;
  final GlobalKey<FormState> formKey = GlobalKey();

  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
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
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          spacer(),
                          const PageTitle(title: Constants.signupPageTitle),
                          sized(h: 30),
                          CustomTextInputField(
                            label: 'Name',
                            isRequired: true,
                            validator: (p0) => ValidationsMixin.isNameValid(p0),
                            onChanged: (s) {
                              if (mounted) {
                                setState(() {
                                  name = s;
                                });
                              }
                            },
                          ),
                          sized(h: 16),
                          CustomDropDownField(
                            label: 'Year of Birth',
                            items: List<DropdownMenuItem<int>>.generate(120,
                                (index) {
                              int value = currentYear - index;
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                ),
                              );
                            }),
                            onChanged: (p0) {
                              if (mounted) {
                                setState(() {
                                  year = p0 as int;
                                });
                              }
                            },
                          ),
                          sized(h: 16),
                          CustomDropDownField(
                            label: 'Gender',
                            items: const <DropdownMenuItem<String>>[
                              DropdownMenuItem<String>(
                                value: 'male',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'female',
                                child: Text(
                                  'Female',
                                ),
                              ),
                            ],
                            onChanged: (p0) {
                              if (mounted) {
                                setState(() {
                                  gender = p0 as String;
                                });
                              }
                            },
                          ),
                          sized(h: 16),
                          CustomTextInputField(
                            label: 'Email',
                            isRequired: true,
                            validator: (p0) =>
                                ValidationsMixin.isEmailValid(p0),
                            onChanged: (s) {
                              if (mounted) {
                                setState(() {
                                  email = s;
                                });
                              }
                            },
                          ),
                          sized(h: 16),
                          CustomTextInputField(
                            label: 'Password',
                            isRequired: true,
                            obscureText: true,
                            validator: (s) =>
                                ValidationsMixin.isPasswordValid(s),
                            onChanged: (s) {
                              if (mounted) {
                                setState(() {
                                  password = s;
                                });
                              }
                            },
                          ),
                          sized(h: 16),
                          CustomTextInputField(
                            label: 'Confirm Password',
                            isRequired: true,
                            obscureText: true,
                            validator: (s) =>
                                ValidationsMixin.iscPasswordValid(password, s),
                            onChanged: (s) {
                              if (mounted) {
                                setState(() {
                                  cPassword = s;
                                });
                              }
                            },
                          ),
                          sized(h: 16),
                          Row(
                            children: [
                              CustomCheckbox(
                                size: 30,
                                onChanged: (v) {
                                  if (mounted) {
                                    setState(() {
                                      termsAccepted = v;
                                    });
                                  }
                                },
                                value: termsAccepted,
                                activeBgColor: AppColors.primaryColor,
                                activeBorderColor: AppColors.primaryColor,
                                type: CustomCheckboxType.custom,
                                customBgColor: Colors.white,
                              ),
                              sized(w: 10),
                              const Expanded(
                                child: Text(
                                  Constants.termsAccept,
                                ),
                              ),
                            ],
                          ),
                          errorText != '' ? Text(errorText) : Container(),
                          sized(h: 16),
                          CustomButton(
                            label: 'Save',
                            onPressed: () {
                              final form = formKey.currentState!;

                              if (form.validate() && termsAccepted) {
                                form.save();
                                loadingNotifier.value = true;

                                context
                                    .read<AuthenticationCubit>()
                                    .signup(
                                        name!, email!, gender!, password!, year)
                                    .catchError((err, s) {
                                  loadingNotifier.value = false;
                                  Fluttertoast.showToast(
                                      msg: handleException(err));
                                }).then((value) {
                                  loadingNotifier.value = false;

                                  navigateBack(context);
                                });
                              } else {
                                if (mounted) {
                                  setState(() {
                                    errorText = 'This is required.';
                                  });
                                }
                                return;
                              }
                            },
                          ),
                          sized(h: 20),
                          Row(
                            children: [
                              const Text(Constants.alreadyAUser),
                              InkWell(
                                onTap: () {
                                  navigateBack(context);
                                },
                                child: const Text(Constants.login),
                              ),
                            ],
                          ),
                          spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
