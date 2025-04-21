import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';
import 'package:toda_app/generated/l10n.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;


    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.loginView);
            },
            icon: Icon(Icons.arrow_back_ios, color: textTheme.bodyLarge!.color),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).forgotpassword,
                  style: Styles.textStyle32.copyWith(
                    color: textTheme.bodyLarge!.color,
                  ),
                ),
                Text(
                  S.of(context).enteryouremailaddressandwewillsendyoualinktoresetyourpassword,
                  style: Styles.textStyle16.copyWith(
                    color: textTheme.bodyMedium?.color?.withOpacity(0.7),
                  ),
                ),
                Text(
                    S.of(context).email,
                  style: Styles.textStyle14,
                ),
                AppTextFormField(
                  hintText: S.of(context).email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).Thefieldisrequired;
                    }
                    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                        .hasMatch(value)) {
                      return S.of(context).Enteravalidemail;
                    }
                    return null;
                  },
                ),
                CustomButton(
                  text: S.of(context).resetpassword,
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
