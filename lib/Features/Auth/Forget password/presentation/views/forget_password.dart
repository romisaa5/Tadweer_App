import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/helper/show_error.dart';
import 'package:toda_app/core/helper/validation_methods.dart';
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
                  S
                      .of(context)
                      .enteryouremailaddressandwewillsendyoualinktoresetyourpassword,
                  style: Styles.textStyle16.copyWith(
                    color: textTheme.bodyMedium?.color?.withValues(alpha:  0.7),
                  ),
                ),
                Text(
                  S.of(context).email,
                  style: Styles.textStyle14,
                ),
                AppTextFormField(
                  controller: emailController,
                  hintText: S.of(context).email,
                  validator: (value) {
                    ValidationMethods.validateEmail(value);
                    return null;
                  },
                ),
                CustomButton(
                  text: S.of(context).resetpassword,
                  color: Color(0xff8875FF),
                  width: MediaQuery.of(context).size.width,
                  onTap: () async {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController.text);
                      showAwesomeDialog(
                          S
                              .of(context)
                              .ApasswordresetemailhasbeensentPleasecheckyourinboxorspamfolder,
                          S.of(context).passwordreset,
                          context,
                          dialogType: DialogType.success, btnOkOnPress: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.loginView);
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showAwesomeDialog(
                          S
                              .of(context)
                              .ThisemailisnotregisteredwithusPleasemakesureitiscorrectorcreateanewaccount,
                          S.of(context).Error,
                          context,
                          dialogType: DialogType.error,
                        );
                      } else {
                        showAwesomeDialog(
                          S.of(context).AnerroroccurredPleasetryagain,
                          S.of(context).Error,
                          context,
                          dialogType: DialogType.error,
                        );
                      }
                    }
                  },
                )
              ]),
        ));
  }
}
