import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Auth/widgets/custom_devider.dart';
import 'package:toda_app/core/helper/show_error.dart';
import 'package:toda_app/core/helper/validation_methods.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_button_signup_login.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';
import 'package:toda_app/generated/l10n.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmpasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordShown = true;
  bool isConfirmPasswordShown = true;
  String? email;
  String? password;
  String? confirmPassword;
  String? userName;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    S.of(context).register,
                    style: Styles.textStyle32.copyWith(
                      color: textTheme.bodyLarge!.color,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    S.of(context).username,
                    style: Styles.textStyle14,
                  ),
                  AppTextFormField(
                    maxLines: 1,
                    onChanged: (userName) {
                      setState(() {
                        this.userName = userName;
                      });
                    },
                    hintText: S.of(context).username,
                    validator: (value) {
                      ValidationMethods.validateUsername(value);
                      return null;
                    },
                    prefixIcon: Icon(
                      FontAwesomeIcons.user,
                      color: Color(0xff8875FF),
                    ),
                  ),
                  Text(
                    S.of(context).email,
                    style: Styles.textStyle14,
                  ),
                  AppTextFormField(
                    maxLines: 1,
                    onChanged: (data) {
                      setState(() {
                        email = data;
                      });
                    },
                    hintText: S.of(context).email,
                    validator: (value) {
                      ValidationMethods.validateEmail(value);
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.email,
                      size: 20.sp,
                      color: ColorsManger.kPrimaryColor,
                    ),
                    focusNode: passwordFocusNode,
                    controller: emailController,
                  ),
                  Text(
                    S.of(context).password,
                    style: Styles.textStyle14,
                  ),
                  AppTextFormField(
                    maxLines: 1,
                    isObscureText: isPasswordShown,
                    onChanged: (data) {
                      setState(() {
                        password = data;
                      });
                    },
                    hintText: S.of(context).password,
                    validator: (value) {
                      ValidationMethods.validatePassword(value);
                      return null;
                    },
                    suffixIcon: isPasswordShown
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordShown = !isPasswordShown;
                              });
                            },
                            icon: Icon(Icons.visibility,
                                color: colorScheme.secondary),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordShown = !isPasswordShown;
                              });
                            },
                            icon: Icon(Icons.visibility_off,
                                color: colorScheme.secondary),
                          ),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      size: 20.sp,
                      color: ColorsManger.kPrimaryColor,
                    ),
                    focusNode: confirmpasswordFocusNode,
                    controller: passwordController,
                  ),
                  Text(
                    S.of(context).confirmpassword,
                    style: Styles.textStyle14,
                  ),
                  AppTextFormField(
                    maxLines: 1,
                    isObscureText: isConfirmPasswordShown,
                    onChanged: (data) {
                      setState(() {
                        confirmPassword = data;
                      });
                    },
                    hintText: S.of(context).confirmpassword,
                    validator: (value) {
                      ValidationMethods.validateConfirmPassword(value);
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      size: 20.sp,
                      color: ColorsManger.kPrimaryColor,
                    ),
                    controller: confirmPasswordController,
                    suffixIcon: isConfirmPasswordShown
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordShown =
                                    !isConfirmPasswordShown;
                              });
                            },
                            icon: Icon(Icons.visibility,
                                color: colorScheme.secondary),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordShown =
                                    !isConfirmPasswordShown;
                              });
                            },
                            icon: Icon(Icons.visibility_off,
                                color: colorScheme.secondary),
                          ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                      text: S.of(context).register,
                      color: ColorsManger.kPrimaryColor,
                      width: MediaQuery.of(context).size.width,
                      onTap: () async {
                        final text = S.of(context);
                        if (_formKey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email!.trim(),
                              password: password!.trim(),
                            );

                            GoRouter.of(context)
                                .pushReplacement(AppRouter.emailVerifiedView);
                          } on FirebaseAuthException catch (e) {
                            String errorMessage =
                                getFirebaseErrorMessage(e.code);
                            showAwesomeDialog(
                                errorMessage, text.Error, context);
                          } catch (e) {
                            showAwesomeDialog(text.Error,
                                text.AnerroroccurredPleasetryagain, context);
                          }
                        }
                      }),
                  SizedBox(height: 5.h),
                  CustomDevider(),
                  SizedBox(height: 5.h),
                  CustomButtonSignupLogin(
                      image: 'assets/images/google_icon.png',
                      text: S.of(context).registerwithGoogle,
                      color: Color(0xff000000),
                      width: MediaQuery.of(context).size.width),
                  CustomButtonSignupLogin(
                      image: 'assets/images/facebook_icon.png',
                      text: S.of(context).registerwithFacebook,
                      color: Color(0xff000000),
                      width: MediaQuery.of(context).size.width),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).alreadyhaveanaccount,
                        style: Styles.textStyle12,
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.loginView);
                        },
                        child: Text(
                          '   ${S.of(context).login}',
                          style: Styles.textStyle12.copyWith(
                            color: Color(0xff8875FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
