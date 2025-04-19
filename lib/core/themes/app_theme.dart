import 'package:flutter/material.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class AppTheme {
  static ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManger.bgcolorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManger.kPrimaryColor,
        unselectedItemColor: Colors.grey),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: Styles.textStyle20.copyWith(
        color: ColorsManger.bgcolorDark,
      ),
      iconTheme: const IconThemeData(color: ColorsManger.bgcolorLight),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      displayLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorsManger.kPrimaryColor,
      secondary: ColorsManger.bgcolorDark,
      background: Colors.white,
      surface: Colors.white,
      error: Colors.red,
    ),
    iconTheme: const IconThemeData(
      color: ColorsManger.kPrimaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsManger.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(20)), // الزوايا
      ),
      elevation: 10,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManger.bgcolorDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManger.bgcolorDark,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManger.kPrimaryColor,
        unselectedItemColor: Colors.grey),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManger.bgcolorDark,
      elevation: 0,
      titleTextStyle: Styles.textStyle20.copyWith(
        color: ColorsManger.bgcolorLight,
      ),
      iconTheme: const IconThemeData(color: ColorsManger.bgcolorLight),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorsManger.kPrimaryColor,
      secondary: ColorsManger.bgcolorLight,
      background: ColorsManger.bgcolorDark,
      surface: ColorsManger.bgcolorDark,
      error: Colors.red,
    ),
    iconTheme: const IconThemeData(
      color: ColorsManger.kPrimaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsManger.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorsManger.bgcolorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      elevation: 10,
    ),
  );
}
