import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Auth/widgets/custom_devider.dart';
import 'package:toda_app/Features/Auth/widgets/custom_textfield_for_password.dart';
import 'package:toda_app/Features/Auth/widgets/custom_textfield_for_username.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_button_signup_login.dart';

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
  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match!')),
        );
        return;
      }

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        print('User registered: ${credential.user?.email}');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

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
                  CustomTextfieldForEmail(
                    passwordFocusNode: passwordFocusNode,
                    emailController: emailController,
                  ),
                  Text(
                    'Password',
                    style: Styles.textStyle14,
                  ),
                  CustomTextfieldforPassword(
                    confirmpasswordFocusNode: confirmpasswordFocusNode,
                    passwordFocusNode: passwordFocusNode,
                    passwordController: passwordController,
                  ),
                  Text(
                    'Confirm Password',
                    style: Styles.textStyle14,
                  ),
                  CustomTextfieldforPassword(
                    passwordController: confirmPasswordController,
                    confirmpasswordFocusNode: confirmpasswordFocusNode,
                  ),
                  CustomButton(
                      onTap: registerUser,
                      text: 'Register',
                      color: Color(0xff8875FF),
                      width: MediaQuery.of(context).size.width),
                  SizedBox(height: 5.h),
                  CustomDevider(),
                  SizedBox(height: 5.h),
                  CustomButtonSignupLogin(
                      icon: FontAwesomeIcons.google,
                      text: 'Register with Google',
                      color: Color(0xff000000),
                      width: MediaQuery.of(context).size.width),
                  CustomButtonSignupLogin(
                      icon: FontAwesomeIcons.facebook,
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
