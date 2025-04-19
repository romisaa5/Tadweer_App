import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toda_app/core/themes/Theme_Provider.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', selectedLanguage);
    await prefs.setBool('isDarkMode', isDarkMode);
    
    // تحديث الـ Theme بناءً على الاختيار
    Provider.of<ThemeProvider>(context, listen: false)
        .toggleTheme(isDarkMode);

    
    GoRouter.of(context).push(AppRouter.firstScreen);
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
            SizedBox(height: 40.h),
             Center(
               child: Text(
                         'Select Language & Theme',
                         style: Styles.textStyle20.copyWith(
                           color: isDarkMode ? colorScheme.onBackground : ColorsManger.bgcolorDark,
                         ),
                       ),
             ),
            SizedBox(height: 30.h),
            Text('Select Language : ',
                style: Styles.textStyle16.copyWith(
                  color:isDarkMode? colorScheme.onBackground: ColorsManger.bgcolorDark
                   ,fontWeight: FontWeight.bold
                )),
            SizedBox(height: 20.h),
            ListTile(
              title: Text(
                'English',
                   style: Styles.textStyle16.copyWith(
                  color:isDarkMode? colorScheme.onBackground: ColorsManger.bgcolorDark
                ),
              ),
              leading: Radio<String>(
                value: 'en',
                groupValue: selectedLanguage,
                onChanged: (val) => setState(() => selectedLanguage = val!),
                activeColor: colorScheme.primary,
              ),
            ),
            ListTile(
              title: Text(
                'عربي',
                   style: Styles.textStyle16.copyWith(
                  color:isDarkMode? colorScheme.onBackground: ColorsManger.bgcolorDark
                ),
              ),
              leading: Radio<String>(
                value: 'ar',
                groupValue: selectedLanguage,
                onChanged: (val) => setState(() => selectedLanguage = val!),
                activeColor: colorScheme.primary,
              ),
            ),
            SizedBox(height: 20.h),
            Text('Select Theme',
                style: Styles.textStyle16.copyWith(
                  color:isDarkMode? colorScheme.onBackground: ColorsManger.bgcolorDark
                   ,fontWeight: FontWeight.bold
                )),
            SizedBox(height: 20.h),
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: Styles.textStyle16.copyWith(
                  color:isDarkMode? colorScheme.onBackground: ColorsManger.bgcolorDark
                ),
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
              activeColor:    ColorsManger.kPrimaryColor,
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
                  'Save and Continue',
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
