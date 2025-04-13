import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class NumberOfTaskDoneOrLeft extends StatelessWidget {
  const NumberOfTaskDoneOrLeft({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 120.w,
      decoration:
          BoxDecoration(border: Border.all(color: ColorsManger.kPrimaryColor)),
      child: Center(
          child: Text(
        text,
        style: Styles.textStyle14,
      )),
    );
  }
}
