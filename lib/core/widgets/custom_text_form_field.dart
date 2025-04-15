import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';


class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
 final Widget? prefixIcon;
 final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String?) validator;
  final void Function(String)? onChanged;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator, this.prefixIcon, this.focusNode, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:contentPadding?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
        focusedBorder: focusedBorder?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: ColorsManger.kPrimaryColor, width: 1.3.w),
        ),
        enabledBorder:enabledBorder?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: ColorsManger.bgcolorLight,
            width: 1.w,
          ), 
        ),  
        hintStyle:hintStyle?? Styles.textStyle14,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor?? ColorsManger.bgcolorDark,
       filled: true,
      ),
      focusNode:focusNode ,
      obscureText:isObscureText?? false,
      style: Styles.textStyle16,
    );
  }
}
