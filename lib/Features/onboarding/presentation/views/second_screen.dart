import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/onboarding/presentation/views/widgets/custom_pageIndicator.dart';
import 'package:toda_app/core/widgets/custom_button.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

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
              S.of(context).createdailyroutines,
              style: Styles.textStyle32.copyWith(color: textTheme.bodyLarge!.color),
            ),
            Text(
             S.of(context).inUptodoyoucancreateyourpersonalizedroutinetostayproductive,
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
                    GoRouter.of(context).push(AppRouter.firstScreen);
                  },
                ),
                CustomButton(
                  width: 90.w,
                  text: S.of(context).next,
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
