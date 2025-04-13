import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      color: Colors.grey.shade100,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: 62.h,
            width: 4.w,
            decoration: BoxDecoration(
              color: ColorsManger.kPrimaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            
          ),
          title: Text(
            'Task Title',
            style: Styles.textStyle16.copyWith(
              color: const Color.fromARGB(255, 41, 38, 38)
            ),
          ),
          subtitle: Text(
            'Task Description',
            style: Styles.textStyle14.copyWith(color: Colors.grey),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: ColorsManger.kPrimaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            height: 30.h,
            width: 50.w,
            child: Icon(  Icons.check, color: Colors.white, size: 20.sp),
          ),
        ),
      ),
    );
  }
}