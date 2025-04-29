import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toda_app/Features/home/logic/provider/task_provider.dart';
import 'package:toda_app/Features/home/models/task_model.dart';
import 'package:toda_app/Features/home/presentation/widgets/select_date&category.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';
import 'package:toda_app/generated/l10n.dart';

class AddTasksBottomSheet extends StatefulWidget {
  const AddTasksBottomSheet({super.key});

  @override
  State<AddTasksBottomSheet> createState() => _AddTasksBottomSheetState();
}

class _AddTasksBottomSheetState extends State<AddTasksBottomSheet> {
  final TextEditingController taskNamecontroller = TextEditingController();
  final TextEditingController taskDetailscontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    var provider = Provider.of<TaskProvider>(context,listen: false);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).AddNewTask,
              style: Styles.textStyle16.copyWith(
                color: colorScheme.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15.h),
            AppTextFormField(
              hintText: S.of(context).TaskName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).Thefieldisrequired;
                }
                return null;
              },
              controller: taskNamecontroller,
            ),
            SizedBox(height: 15.h),
            AppTextFormField(
              hintText: S.of(context).TaskDetails,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).Thefieldisrequired;
                }
                return null;
              },
              maxLines: 4,
              controller: taskDetailscontroller,
            ),
            SizedBox(height: 15.h),
            SelectDateandcategory(
              onDateSelected: (date) {
                selectedDate = date;
              },
              onCategorySelected: (category) {
                selectedCategory = category;
              },
            ),
            SizedBox(height: 15.h),
            CustomButton(
              onTap: ()async{
                if (_formKey.currentState!.validate()) {
                  final newTask = TaskModel(
                    name: taskNamecontroller.text.trim(),
                    details: taskDetailscontroller.text.trim(),
                    date: selectedDate ?? DateTime.now(),
                    category: selectedCategory,
                  );
                await  provider.addTask(newTask);
                  Navigator.pop(context);
                }
              },
              text: S.of(context).AddTask,
              color: ColorsManger.kPrimaryColor,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
