import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';

class AddTasksBottomSheet extends StatelessWidget {
  const AddTasksBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(spacing: 20.h, mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Add New Task',
            style: Styles.textStyle16.copyWith(
              color: colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Task Title',
              labelStyle: TextStyle(
                color: colorScheme.secondary.withValues(alpha: .7),
              ),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorScheme.primary,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorScheme.secondary.withOpacity(0.5),
                ),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: colorScheme.secondary.withValues(alpha: .7),
              ),
              labelText: 'Descreiption',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorScheme.primary,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorScheme.secondary.withOpacity(0.5),
                ),
              ),
            ),
          ),
          CustomButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'Add Task',
              color: ColorsManger.kPrimaryColor,
              width: MediaQuery.of(context).size.width)
        ]));
  }
}
