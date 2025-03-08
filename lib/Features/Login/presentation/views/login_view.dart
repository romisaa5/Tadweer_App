import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Login/presentation/views/widgets/custom_devider.dart';
import 'package:toda_app/Features/Login/presentation/views/widgets/custom_textfield_for_password.dart';
import 'package:toda_app/Features/Login/presentation/views/widgets/custom_textfield_for_username.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/utils/styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            CustomTextfieldForEmail(),
            Text(
              'Password',
              style: Styles.textStyle14,
            ),
            CustomTextfieldforPassword(),
       
               TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.forgetpasssword);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forget Passsword ?',
                        style: Styles.textStyle12.copyWith(color:Color(0xff8875FF) ),
                      ),
                    )),

            CustomButton(
                text: 'Login',
                color: Color(0xff8875FF),
                width: MediaQuery.of(context).size.width),
                  SizedBox(height: 10.h),
            CustomDevider(),
              SizedBox(height: 10.h),
            CustomButton(
                text: 'Login with Google',
                color: Color(0xff000000),
                width: MediaQuery.of(context).size.width),
            CustomButton(
                text: 'Login with Facebook',
                color: Color(0xff000000),
                width: MediaQuery.of(context).size.width),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an acount?",style: Styles.textStyle12,),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.registerView);
                    },
                    child: Text(
                      '   Register',
                      style: Styles.textStyle12.copyWith(color:Color(0xff8875FF) )
                    )),

              ],
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}
