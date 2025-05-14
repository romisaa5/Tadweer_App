import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Auth/widgets/custom_devider.dart';
import 'package:toda_app/core/helper/login_methods.dart';
import 'package:toda_app/core/helper/show_error.dart';
import 'package:toda_app/core/helper/validation_methods.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_button_signup_login.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';
import 'package:toda_app/generated/l10n.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
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
                Text(S.of(context).login,
                    style: Styles.textStyle32.copyWith(
                      color: textTheme.bodyLarge!.color,
                    )),
                SizedBox(height: 15.h),
                Text(
                  S.of(context).email,
                  style: Styles.textStyle14,
                ),
                AppTextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  hintText: S.of(context).email,
                  validator: (value) {
                    ValidationMethods.validateEmail(value);
                    return null;
                  },
                  prefixIcon: Icon(
                    Icons.email,
                    size: 20,
                    color: ColorsManger.kPrimaryColor,
                  ),
                  focusNode: passwordFocusNode,
                  controller: emailController,
                  backgroundColor: colorScheme.background,
                ),
                Text(
                  S.of(context).password,
                  style: Styles.textStyle14,
                ),
                AppTextFormField(
                  isObscureText: isshown,
                  onChanged: (value) {
                    password = value;
                  },
                  hintText: S.of(context).password,
                  validator: (value) {
                    ValidationMethods.validatePassword(value);
                    return null;
                  },
                  suffixIcon: isshown
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isshown = !isshown;
                            });
                          },
                          icon: Icon(Icons.visibility,
                              color: colorScheme.secondary),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isshown = !isshown;
                            });
                          },
                          icon: Icon(Icons.visibility_off,
                              color: colorScheme.secondary)),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    size: 20,
                    color: ColorsManger.kPrimaryColor,
                  ),
                  controller: passwordController,
                  maxLines: 1,
                ),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.forgetpasssword);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        S.of(context).forgotpassword,
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
                            showAwesomeDialog(
                                S.of(context).Nouserfoundforthatemail,
                                S.of(context).Error,
                                context);
                          } else if (ex.code == 'wrong-password') {
                            showAwesomeDialog(
                                S.of(context).Wrongpasswordprovidedforthatuser,
                                S.of(context).Error,
                                context);
                          } else {
                           
                            showAwesomeDialog(
                             
                                S.of(context).AnerroroccurredPleasetryagain,
                                S.of(context).Error,
                                context);
                          }
                        }
                      }
                    },
                    text: S.of(context).login,
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
                    text: S.of(context).loginwithGoogle,
                    color: Color(0xff000000),
                    width: MediaQuery.of(context).size.width),
                CustomButtonSignupLogin(
                    onTap: () async {
                      LoginMethods.signInWithFacebook(context);
                    },
                    image: 'assets/images/facebook_icon.png',
                    text: S.of(context).loginwithFacebook,
                    color: Color(0xff000000),
                    width: MediaQuery.of(context).size.width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).donthaveanaccount,
                      style: Styles.textStyle12,
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.registerView);
                      },
                      child: Text(
                        '   ${S.of(context).register}',
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
