import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/onboarding/presentation/views/widgets/custom_pageIndicator.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/utils/styles.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          spacing: 25,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/images/onboard3.png'),
            PageIndicator(currentIndex: 2, totalPages: 3),
            Text('Orgonaize your tasks', style: Styles.textStyle32),
            Text(
              'You can organize your daily tasks by adding your tasks into separate categories',
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 90.w,
                  text: 'Back',
                  color: Color(0xff),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.secondScreen);
                  },
                ),
                CustomButton(
                  width: 151.w,
                  text: 'GETSTATED',
                  color: Color(0xff8875FF),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.welcomeView);
                  },
                )
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
