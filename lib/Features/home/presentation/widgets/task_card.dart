import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/Features/home/models/task_model.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade300,
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SizedBox(
          height: 100.h,
          child: Center(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 65.h,
                width: 4.w,
                decoration: BoxDecoration(
                  color: ColorsManger.kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              title: Text(
                taskModel.name,
                style: Styles.textStyle16
                    .copyWith(color: const Color.fromARGB(255, 41, 38, 38)),
              ),
              subtitle: Text(
                taskModel.details,
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: ColorsManger.kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                height: 35.h,
                width: 60.w,
                child: Icon(Icons.check, color: Colors.white, size: 24.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
