import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';

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
                "Password reset",
                style: Styles.textStyle32.copyWith(
                  color: textTheme.bodyLarge!.color,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                  "Your password has been successfully reset. click confirm to set a new password",
                  style: Styles.textStyle14.copyWith(
                    color: textTheme.bodyMedium?.color?.withOpacity(0.7),
                  )),
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
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                  text: 'Update Password',
                  color: Color(0xff8875FF),
                  width: MediaQuery.of(context).size.width)
            ]),
      ),
    );
  }
}
