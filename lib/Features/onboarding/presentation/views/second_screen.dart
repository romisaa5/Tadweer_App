import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/onboarding/presentation/views/widgets/custom_pageIndicator.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          spacing: 25,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/images/onboard2.png'),
            const PageIndicator(currentIndex: 1, totalPages: 3),
            Text(
              'Create daily routine',
              style: Styles.textStyle32.copyWith(color: textTheme.bodyLarge!.color),
            ),
            Text(
              'In Uptodo  you can create your personalized routine to stay productive',
              style: Styles.textStyle16.copyWith(color: textTheme.bodyMedium!.color),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 90.w,
                  text: 'Back',
                  color: Colors.black,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.firstScreen);
                  },
                ),
                CustomButton(
                  width: 90.w,
                  text: 'Next',
                  color: theme.colorScheme.primary,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.thirdScreen);
                  },
                ),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
