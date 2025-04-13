import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/home/presentation/widgets/number_of_task_done_or_left.dart';
import 'package:toda_app/Features/home/presentation/widgets/profile_list_tile.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';

class ProfieView extends StatelessWidget {
  const ProfieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: 16.0.w,right: 16.w,top: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20.h,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Profile',
                style: Styles.textStyle18,
              ),
              CircleAvatar(
                radius: 42.r,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(42.r),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      fit: BoxFit.fill,
                    )),
              ),
              Text(
                'Romisaa Fadel',
                style: Styles.textStyle16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberOfTaskDoneOrLeft(text: '10 Tasks Left'),
                  NumberOfTaskDoneOrLeft(text: '15 Tasks Done')
                ],
              ),
              Divider(
                endIndent: 15,
                indent: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: Styles.textStyle16,
                  ),
                  ProfileListTile(
                      title: 'App Settings',
                      onPressed: () {},
                      icon: Icons.settings),
                  Divider(
                    endIndent: 15,
                    indent: 15,
                  ),
                  Text(
                    'Account',
                    style: Styles.textStyle16,
                  ),
                  ProfileListTile(
                    title: 'Change account name',
                    onPressed: () {},
                    icon: Icons.person_outlined,
                  ),
                  ProfileListTile(
                      title: 'Change account password',
                      onPressed: () {},
                      icon: Icons.key_outlined),
                  ProfileListTile(
                      title: 'Change account Image',
                      onPressed: () {},
                      icon: Icons.camera_alt_outlined),
                  Divider(
                    endIndent: 15,
                    indent: 15,
                  ),
                  ProfileListTile(
                    title: 'Log Out',
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRouter.loginView);
                    },
                    icon: Icons.logout,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
