import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:toda_app/Features/home/logic/provider/task_provider.dart';
import 'package:toda_app/Features/home/presentation/widgets/change_acount_image.dart';
import 'package:toda_app/Features/home/presentation/widgets/change_acount_name.dart';
import 'package:toda_app/Features/home/presentation/widgets/change_acount_password.dart';
import 'package:toda_app/Features/home/presentation/widgets/log_out.dart';
import 'package:toda_app/Features/home/presentation/widgets/number_of_task_done_or_left.dart';
import 'package:toda_app/Features/home/presentation/widgets/profile_list_tile.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final accountName = Provider.of<TaskProvider>(context).accountname;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final tasks = Provider.of<TaskProvider>(context).tasks;
    final doneTasks = tasks.where((task) => task.isDone).length;
    final notDoneTasks = tasks.where((task) => !task.isDone).length;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.w, top: 16.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                S.of(context).Profile,
                style:
                    Styles.textStyle24.copyWith(color: colorScheme.secondary),
              ),
              Consumer<TaskProvider>(
                builder: (context, provider, _) {
                  final imagePath = provider.accountImagePath;
                  return CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        imagePath != null && File(imagePath).existsSync()
                            ? FileImage(File(imagePath))
                            : AssetImage('assets/images/profile.jpg')
                                as ImageProvider,
                  );
                },
              ),
              Text(
                accountName.isNotEmpty ? accountName : 'No Name Set',
                style: Styles.textStyle16.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberOfTaskDoneOrLeft(
                      text: '$notDoneTasks ${S.of(context).TasksLeft}'),
                  NumberOfTaskDoneOrLeft(
                      text: '$doneTasks ${S.of(context).TasksDone}'),
                ],
              ),
              Divider(
                  color: Colors.grey,
                  thickness: .5,
                  endIndent: 15.h,
                  indent: 15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).Settings,
                    style: Styles.textStyle16.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ProfileListTile(
                      title: S.of(context).AppSettings,
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.appSetting);
                      },
                      icon: Icons.settings),
                  Divider(
                      color: Colors.grey,
                      thickness: .5,
                      endIndent: 15.h,
                      indent: 15.h),
                  Text(
                    S.of(context).Account,
                    style: Styles.textStyle16.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ChangeAcountName(),
                  ChangeAcountPassword(),
                  ChangeAcountImage(),
                  Divider(
                      color: Colors.grey,
                      thickness: .5,
                      endIndent: 15.h,
                      indent: 15.h),
                LogOut()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
