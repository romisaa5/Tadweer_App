import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class CustomButtonSignupLogin extends StatelessWidget {
  const CustomButtonSignupLogin(
      {super.key,
      required this.text,
      required this.color,
      required this.width,
      this.onTap,
      this.image});
  final String text;
  final Color color;
  final double width;
  final String? image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: 48.h,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff8875FF),
              ),
              borderRadius: BorderRadius.circular(2),
              color: color),
          child: Center(
            child: Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image ?? '',
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.fill,
                ),
                Text(
                  text,
                  style: Styles.textStyle16.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
