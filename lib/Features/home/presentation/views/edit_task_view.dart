import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toda_app/Features/home/models/task_model.dart';
import 'package:toda_app/Features/home/logic/provider/task_provider.dart';
import 'package:toda_app/Features/home/presentation/widgets/category_selector.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/widgets/custom_text_form_field.dart';
import 'package:toda_app/generated/l10n.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel task;
  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController nameController;
  late TextEditingController detailsController;
  late TextEditingController categoryController;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.task.name);
    detailsController = TextEditingController(text: widget.task.details);
    categoryController = TextEditingController(text: widget.task.category);
    selectedDate = widget.task.date;
  }

  @override
  void dispose() {
    nameController.dispose();
    detailsController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).EditTask,
          style: Styles.textStyle16.copyWith(color: colorScheme.secondary),
        ),
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.homeview);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: colorScheme.secondary,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: [
            Text(
              S.of(context).TaskName,
              style: Styles.textStyle16.copyWith(color: colorScheme.secondary),
            ),
            AppTextFormField(
              hintText: S.of(context).TaskName,
              validator: (value) {
                if (value == null) {
                  Text(S.of(context).Thefieldisrequired);
                }
                return null;
              },
              controller: nameController,
            ),
            Text(
              S.of(context).TaskDetails,
              style: Styles.textStyle16.copyWith(color: colorScheme.secondary),
            ),
            AppTextFormField(
              hintText: S.of(context).Details,
              validator: (value) {
                if (value == null) {
                  Text(S.of(context).Thefieldisrequired);
                }
                return null;
              },
              controller: detailsController,
            ),
            Text(
              S.of(context).category,
              style: Styles.textStyle16.copyWith(color: colorScheme.secondary),
            ),
            AppTextFormField(
              hintText: S.of(context).category,
              validator: (value) {
                if (value == null) {
                  Text(S.of(context).Thefieldisrequired);
                }
                return null;
              },
              controller: categoryController,
              suffixIcon: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return CategorySelector(
                        onCategorySelected: (category) {
                          setState(() {
                            categoryController.text = category;
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.category,
                  color: ColorsManger.kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.calendar_today),
                SizedBox(width: 8.w),
                Text(DateFormat('dd-MM-yyyy').format(selectedDate)),
                const Spacer(),
                TextButton(
                  onPressed: () => _pickDate(context),
                  child: Text(S.of(context).ChangeDate),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              width: double.infinity,
              color: ColorsManger.kPrimaryColor,
              onTap: () async {
                final updatedTask = TaskModel(
                  id: widget.task.id,
                  name: nameController.text,
                  details: detailsController.text,
                  category: categoryController.text,
                  date: selectedDate,
                );
                final navigator = Navigator.pop(context);
                await provider.editTask(updatedTask);
                navigator;
              },
              text: S.of(context).SaveChanges,
            ),
          ],
        ),
      ),
    );
  }
}
