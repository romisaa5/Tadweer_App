import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/Features/login&register/presentation/views/widgets/custom_textfield_for_password.dart';
import 'package:toda_app/core/utils/styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});

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
          Text(
            'Password',
            style: Styles.textStyle14,
          ),
          CustomTextfieldforPassword(),
          Text(
            'Confirm Password',
            style: Styles.textStyle14,
          ),
          CustomTextfieldforPassword(),
          SizedBox(height: 15,),
          CustomButton(
              text: 'Update Password',
              color: Color(0xff8875FF),
              width: MediaQuery.of(context).size.width)
        ]),
      ),
    );
  }
}
