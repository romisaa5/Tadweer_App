import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/onboarding/presentation/views/widgets/custom_pageIndicator.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
            Image.asset('assets/images/onboard3.png'),
            const PageIndicator(currentIndex: 2, totalPages: 3),
            Text(
              S.of(context).orgonaizeyourtasks,
              style: Styles.textStyle32.copyWith(color: textTheme.bodyLarge!.color),
            ),
            Text(
              S.of(context).youcanorganizeyourdailytasksbyaddingyourtasksintoseparatecategories,
              style: Styles.textStyle16.copyWith(color: textTheme.bodyMedium!.color),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 90.w,
                  text: S.of(context).back,
                  color: Colors.black,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.secondScreen);
                  },
                ),
                CustomButton(
                  width: 151.w,
                  text: S.of(context).getStarted,
                  color: theme.colorScheme.primary,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.welcomeView);
                  },
                )
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
