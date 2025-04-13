import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
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
              style: Styles.textStyle32,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Your password has been successfully reset. click confirm to set a new password",
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.setnewpassword);
              },
              text: "Confirm",
              color: Color(0xff8875FF),
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
