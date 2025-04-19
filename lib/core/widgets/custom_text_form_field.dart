import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final InputBorder? errorBorder;

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
    required this.validator,
    this.prefixIcon,
    this.focusNode,
    this.onChanged,
    this.errorBorder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      cursorColor: colorScheme.primary,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(color: colorScheme.primary, width: 1.3.w),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(color: colorScheme.outline, width: 1.w),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1.w,
                
              ),
            ),
        focusedErrorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1.w,
              ),
            ),
        hintStyle: hintStyle ?? Styles.textStyle14.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? colorScheme.surface,
        filled: true,
      ),
      focusNode: focusNode,
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? Styles.textStyle16.copyWith(color: colorScheme.onSurface),
    );
  }
}
