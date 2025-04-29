import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:toda_app/Features/home/models/task_model.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    DateFormat formattedDate = DateFormat('dd-MM-yyyy');
    return Card(
      shadowColor: Colors.grey.shade300,
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
        child: Center(
          child: Row(
            spacing: 15.w,
            children: [
              Container(
                height: 75.h,
                width: 4.w,
                decoration: BoxDecoration(
                  color: ColorsManger.kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              Column(
                spacing: 4.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.name,
                    style: Styles.textStyle16
                        .copyWith(color: const Color.fromARGB(255, 41, 38, 38)),
                  ),
                  Text(
                    taskModel.details,
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                  ),
                  Row(
                    spacing: 5.w,
                    children: [
                      Icon(
                        Icons.category,
                        size: 18,
                      ),
                      Text(
                        taskModel.category,
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              Column(
                spacing: 20.h,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsManger.kPrimaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    height: 35.h,
                    width: 60.w,
                    child: Icon(Icons.check, color: Colors.white, size: 24.sp),
                  ),
                  Row(spacing: 5.w, children: [
                    Icon(
                      Icons.alarm,
                      size: 18,
                    ),
                    Text(
                      formattedDate.format(taskModel.date),
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
