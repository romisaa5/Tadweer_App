import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Auth/Login/presentation/views/widgets/custom_devider.dart';
import 'package:toda_app/Features/Auth/Login/presentation/views/widgets/custom_textfield_for_password.dart';
import 'package:toda_app/Features/Auth/Login/presentation/views/widgets/custom_textfield_for_username.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/utils/styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_button_signup_login.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Spacer(),
              Text(
                'Login',
                style: Styles.textStyle32,
              ),
              SizedBox(height: 15.h),
              Text(
                'User Name ',
                style: Styles.textStyle14,
              ),
              CustomTextfieldForEmail(
                
                emailController: emailController,),
              Text(
                'Password',
                style: Styles.textStyle14,
              ),
              CustomTextfieldforPassword(passwordController: passwordController,),
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.forgetpasssword);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forget Passsword ?',
                      style:
                          Styles.textStyle12.copyWith(color: Color(0xff8875FF)),
                    ),
                  )),
              CustomButton(
                  text: 'Login',
                  color: Color(0xff8875FF),
                  width: MediaQuery.of(context).size.width),
              SizedBox(height: 10.h),
              CustomDevider(),
              SizedBox(height: 10.h),
              CustomButtonSignupLogin(
                  icon:FontAwesomeIcons.google,
                  text: 'Login with Google',
                  color: Color(0xff000000),
                  width: MediaQuery.of(context).size.width),
              CustomButtonSignupLogin(
                  icon: FontAwesomeIcons.facebook,
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
                        GoRouter.of(context).push(AppRouter.registerView);
                      },
                      child: Text('   Register',
                          style: Styles.textStyle12
                              .copyWith(color: Color(0xff8875FF)))),
                ],
              ),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
