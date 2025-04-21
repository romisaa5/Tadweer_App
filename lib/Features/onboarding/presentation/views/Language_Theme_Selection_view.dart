import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toda_app/core/helper/localizition_method.dart';
import 'package:toda_app/core/themes/Theme_Provider.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/generated/l10n.dart';

class LanguageThemeSelectionView extends StatefulWidget {
  const LanguageThemeSelectionView({super.key});

  @override
  State<LanguageThemeSelectionView> createState() =>
      _LanguageThemeSelectionViewState();
}

class _LanguageThemeSelectionViewState
    extends State<LanguageThemeSelectionView> {
  String selectedLanguage = 'en';
  bool isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _loadInitialSettings();
  }

  void _loadInitialSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('language') ?? 'en';
      isDarkMode = prefs.getBool('isDarkMode') ?? true;
    });
  }

  void saveSettings() async {
    await Provider.of<LanguageProvider>(context, listen: false)
        .setLocale(selectedLanguage);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme(isDarkMode);

    (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified)
        ? GoRouter.of(context).push(AppRouter.homeview)
        : GoRouter.of(context).push(AppRouter.firstScreen);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center(
              child: Text(
                S.of(context).selectLanguageandtheme,
                style: Styles.textStyle20.copyWith(
                  color: isDarkMode
                      ? colorScheme.onBackground
                      : ColorsManger.bgcolorDark,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/splash12.png',
                width: 200.w,
                height: 200.h,
              ),
            ),
            SizedBox(height: 30.h),
            Text(S.of(context).selectLanguage,
                style: Styles.textStyle16.copyWith(
                    color: isDarkMode
                        ? colorScheme.onBackground
                        : ColorsManger.bgcolorDark,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            ListTile(
              title: Text(
                S.of(context).English,
                style: Styles.textStyle16.copyWith(
                    color: isDarkMode
                        ? colorScheme.onBackground
                        : ColorsManger.bgcolorDark),
              ),
              leading: Radio<String>(
                value: 'en',
                groupValue: selectedLanguage,
                onChanged: (val) {
                  setState(() {
                    selectedLanguage = val!;
                  });
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLocale(val!);
                },
                activeColor: ColorsManger.kPrimaryColor,
                fillColor: MaterialStateProperty.all(
                  isDarkMode
                      ? ColorsManger.bgcolorLight
                      : ColorsManger.bgcolorDark,
                ),
              ),
            ),
            ListTile(
              title: Text(
                S.of(context).Arabic,
                style: Styles.textStyle16.copyWith(
                    color: isDarkMode
                        ? colorScheme.onBackground
                        : ColorsManger.bgcolorDark),
              ),
              leading: Radio<String>(
                value: 'ar',
                groupValue: selectedLanguage,
                onChanged: (val) {
                  setState(() {
                    selectedLanguage = val!;
                  });
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLocale(val!);
                },
                activeColor: colorScheme.primary,
              ),
            ),
            SizedBox(height: 20.h),
            Text(S.of(context).selectTheme,
                style: Styles.textStyle16.copyWith(
                    color: isDarkMode
                        ? colorScheme.onBackground
                        : ColorsManger.bgcolorDark,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            SwitchListTile(
              title: Text(
                S.of(context).darkmode,
                style: Styles.textStyle16.copyWith(
                    color: isDarkMode
                        ? colorScheme.onBackground
                        : ColorsManger.bgcolorDark),
              ),
              value: isDarkMode,
              onChanged: (val) {
                setState(() {
                  isDarkMode = val;
                });
        
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(isDarkMode);
              },
              secondary: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? Colors.grey : Colors.amber,
              ),
              activeColor: ColorsManger.kPrimaryColor,
              inactiveTrackColor: Colors.grey,
              inactiveThumbColor: Colors.black,
            ),
            SizedBox(height: 20),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveSettings,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                ),
                child: Text(
                  S.of(context).saveandcontinue,
                  style: Styles.textStyle16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
