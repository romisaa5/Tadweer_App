import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/generated/l10n.dart';

class EmailVerifiedView extends StatefulWidget {
  const EmailVerifiedView({super.key});

  @override
  State<EmailVerifiedView> createState() => _EmailVerifiedViewState();
}

class _EmailVerifiedViewState extends State<EmailVerifiedView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      timer?.cancel();
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(AppRouter.upLoadimage);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              S.of(context).EmailVerification,
              style: Styles.textStyle24.copyWith(
                color: textTheme.bodyLarge!.color,
              ),
            ),
            SizedBox(height: 20.h),
            const Icon(Icons.check_circle,
                size: 100, color: ColorsManger.kPrimaryColor),
            SizedBox(height: 20.h),
           Text( S.of(context).Pleaseverifyyouremailaddress,
                style: TextStyle(fontSize: 16)),
            Text(S.of(context).Averificationlinkhasbeensenttoyouremail,
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      backgroundColor: ColorsManger.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.currentUser!
                          .sendEmailVerification();
                    },
                    child: Text(
                      S.of(context).ResendEmail,
                      style: Styles.textStyle14.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      backgroundColor: ColorsManger.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.loginView);
                    },
                    child: Text(
                      S.of(context).GotoLogin,
                      style: Styles.textStyle14.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
