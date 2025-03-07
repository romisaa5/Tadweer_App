import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, required this.color, this.onTap, required this.width});
  final String text;
  final Color color;
  final double width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: 48.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2), color: color),
          child: Center(
            child: Text(
              text,
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
