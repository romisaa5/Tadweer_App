import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/onboarding/presentation/views/widgets/custom_pageIndicator.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/utils/styles.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
            Image.asset('assets/images/onboard2.png'),
            PageIndicator(currentIndex: 1, totalPages: 3),
            Text('Create daily routine', style: Styles.textStyle32),
            Text(
              'In Uptodo  you can create your personalized routine to stay productive',
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
                  color: Color(0xff000000),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.firstScreen);
                  },
                ),
                CustomButton(
                  width: 90.w,
                  text: 'Next',
                  color: Color(0xff8875FF),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.thirdScreen);
                  },
                ),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
