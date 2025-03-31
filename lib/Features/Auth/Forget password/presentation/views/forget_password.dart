import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Auth/Login/presentation/views/widgets/custom_textfield_for_username.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/utils/styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
   final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forget Password',
                  style: Styles.textStyle32,
                ),
                Text(
                  'Please enter your email to reset the password',
                  style: Styles.textStyle16,
                ),
                Text(
                  'Your Email ',
                  style: Styles.textStyle14,
                ),
                CustomTextfieldForEmail(emailController: emailController,),
                CustomButton(
                  text: 'Reset Password',
                  color: Color(0xff8875FF),
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.verificationScreen);
                  },
                )
              ]),
        ));
  }
}
