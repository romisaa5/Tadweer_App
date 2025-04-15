import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Auth/widgets/custom_devider.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_button_signup_login.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';

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

  bool isshown = false;
  @override
  Widget build(BuildContext context) {
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
                    'Register',
                    style: Styles.textStyle32,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'User Name ',
                    style: Styles.textStyle14,
                  ),
                  AppTextFormField(
                    hintText: 'User Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      FontAwesomeIcons.user,
                      color: Color(0xff8875FF),
                    ),
                  ),
                  Text(
                    'Email',
                    style: Styles.textStyle14,
                  ),
                  AppTextFormField(
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is required';
                      }
                      if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
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
                    'Password',
                    style: Styles.textStyle14,
                  ),
                  AppTextFormField(
                    hintText: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is required';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                          .hasMatch(value)) {
                        return 'Password must contain at least one letter and one number';
                      }
                      return null;
                    },
                    suffixIcon: isshown
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isshown = !isshown;
                              });
                            },
                            icon: Icon(Icons.visibility))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isshown = !isshown;
                              });
                            },
                            icon: Icon(Icons.visibility_off)),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      size: 20.sp,
                      color: ColorsManger.kPrimaryColor,
                    ),
                    focusNode: confirmpasswordFocusNode,
                    controller: passwordController,
                  ),
                  Text(
                    'Confirm Password',
                    style: Styles.textStyle14,
                  ),
                  AppTextFormField(
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is required';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                          .hasMatch(value)) {
                        return 'Password must contain at least one letter and one number';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      size: 20.sp,
                      color: ColorsManger.kPrimaryColor,
                    ),
                    controller: confirmPasswordController,
                    suffixIcon: isshown
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isshown = !isshown;
                              });
                            },
                            icon: Icon(Icons.visibility))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isshown = !isshown;
                              });
                            },
                            icon: Icon(Icons.visibility_off)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.upLoadimage);
                      },
                      text: 'Register',
                      color: Color(0xff8875FF),
                      width: MediaQuery.of(context).size.width),
                  SizedBox(height: 5.h),
                  CustomDevider(),
                  SizedBox(height: 5.h),
                  CustomButtonSignupLogin(
                      image: 'assets/images/google_icon.png',
                      text: 'Register with Google',
                      color: Color(0xff000000),
                      width: MediaQuery.of(context).size.width),
                  CustomButtonSignupLogin(
                      image: 'assets/images/facebook_icon.png',
                      text: 'Register with Facebook',
                      color: Color(0xff000000),
                      width: MediaQuery.of(context).size.width),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already have an acount?",
                        style: Styles.textStyle12,
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.loginView);
                        },
                        child: Text(
                          '   Login',
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
