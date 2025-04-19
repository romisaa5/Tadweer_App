import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Auth/widgets/custom_devider.dart';
import 'package:toda_app/core/helper/login_methods.dart';
import 'package:toda_app/core/helper/show_error.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_button_signup_login.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  String? email;
  String? password;
  bool isshown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Login',
                  style: Styles.textStyle32,
                ),
                SizedBox(height: 15.h),
                Text(
                  'Email',
                  style: Styles.textStyle14,
                ),
                AppTextFormField(
                  onChanged: (value) {
                    email = value;
                  },
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
                    size: 20,
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
                  isObscureText: isshown,
                  onChanged: (value) {
                    password = value;
                  },
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
                    size: 20,
                    color: ColorsManger.kPrimaryColor,
                  ),
                  controller: passwordController,
                ),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.forgetpasssword);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forget Passsword ?',
                        style: Styles.textStyle12
                            .copyWith(color: Color(0xff8875FF)),
                      ),
                    )),
                CustomButton(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        try {
                          UserCredential user = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: email!.trim(),
                            password: password!.trim(),
                          );
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.homeview);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            showAwesomeDialog('No user found for that email.',
                                'Error ', context);
                          } else if (ex.code == 'wrong-password') {
                            showAwesomeDialog(
                              'Wrong password provided.',
                              'Error ',
                              context,
                            );
                          } else {
                            showAwesomeDialog(
                                'An error occurred. Please try again.',
                                'Error ',
                                context);
                          }
                        }
                      }
                    },
                    text: 'Login',
                    color: Color(0xff8875FF),
                    width: MediaQuery.of(context).size.width),
                SizedBox(height: 10.h),
                CustomDevider(),
                SizedBox(height: 10.h),
                CustomButtonSignupLogin(
                    onTap: () async {
                      LoginMethods.signInWithGoogle(context);
                    },
                    image: 'assets/images/google_icon.png',
                    text: 'Login with Google',
                    color: Color(0xff000000),
                    width: MediaQuery.of(context).size.width),
                CustomButtonSignupLogin(
                    onTap: () async {
                      LoginMethods.signInWithFacebook(context);
                    },
                    image: 'assets/images/facebook_icon.png',
                    text: 'Login with Facebook',
                    color: Color(0xff000000),
                    width: MediaQuery.of(context).size.width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an acount?",
                      style: Styles.textStyle12,
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.registerView);
                      },
                      child: Text(
                        '   Register',
                        style: Styles.textStyle12.copyWith(
                          color: Color(0xff8875FF),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
