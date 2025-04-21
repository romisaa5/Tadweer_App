import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/generated/l10n.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textTheme.bodyLarge!.color),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.verificationScreen);
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
             S.of(context).yourpasswordhasbeensuccessfullyresetclickconfirmtosetanewpassword,
              style: Styles.textStyle14.copyWith(
                color: textTheme.bodyMedium?.color?.withOpacity(0.7),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.setnewpassword);
              },
              text: S.of(context).confirm,
              color: Color(0xff8875FF),
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
