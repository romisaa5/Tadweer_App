import 'package:flutter/material.dart';
import 'package:toda_app/core/themes/colors.dart';

class AppTheme {
  static ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManger.bgcolorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white, type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManger.kPrimaryColor ,
        unselectedItemColor: Colors.grey),
  );
}
