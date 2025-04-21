import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';
import 'package:toda_app/generated/l10n.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textTheme.bodyLarge!.color),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.passwordreset);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).passwordreset,
                style: Styles.textStyle32.copyWith(
                  color: textTheme.bodyLarge!.color,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                  S
                      .of(context)
                      .yourpasswordhasbeensuccessfullyresetclickconfirmtosetanewpassword,
                  style: Styles.textStyle14.copyWith(
                    color: textTheme.bodyMedium?.color?.withOpacity(0.7),
                  )),
              Text(
                S.of(context).password,
                style: Styles.textStyle14,
              ),
              AppTextFormField(
                hintText: S.of(context).password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).Thefieldisrequired;
                  }
                  if (value.length < 8) {
                    return S.of(context).Passwordmustbeatleast8characters;
                  }
                  if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                      .hasMatch(value)) {
                    return S
                        .of(context)
                        .Passwordmustcontainatleastoneletterandonenumber;
                  }
                  return null;
                },
              ),
              Text(
                S.of(context).confirmpassword,
                style: Styles.textStyle14,
              ),
              AppTextFormField(
                hintText: S.of(context).confirmpassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).Thefieldisrequired;
                  }
                  if (value.length < 8) {
                    return S.of(context).Passwordmustbeatleast8characters;
                  }
                  if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                      .hasMatch(value)) {
                    return S
                        .of(context)
                        .Passwordmustcontainatleastoneletterandonenumber;
                  }
                  if (value != passwordController.text) {
                    return S.of(context).Passwordsdonotmatch;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                  text: S.of(context).updatepassword,
                  color: Color(0xff8875FF),
                  width: MediaQuery.of(context).size.width)
            ]),
      ),
    );
  }
}
