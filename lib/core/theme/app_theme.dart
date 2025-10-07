import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get primary2nd;
  Color get primary3rd;
  Color get primary4th;
  Color get primary5th;
  Color get primary6th;

  Color get secondary;
  Color get secondary2nd;
  Color get secondary3rd;
  Color get secondary4th;
  Color get secondary5th;
  Color get secondary6th;

  Color get success;
  Color get warning;
  Color get error;

  Color get surface;
  Color get surface50;
  Color get surface100;
  Color get surface200;
  Color get surface300;
  Color get surface400;
  Color get surface500;
  Color get surface600;
  Color get surface700;
  Color get surface800;
  Color get surface900;

  Color get background;
  Color get buttonTextColor;
}

abstract class AppTheme {
  AppColors get colors;
  TextTheme get textTheme;
  ThemeData get theme;
  FilledButtonThemeData get filledButtonTheme;
  OutlinedButtonThemeData get outlinedButtonTheme;
  InputDecorationTheme get inputDecorationTheme;
  AppBarTheme get appBarTheme;
  BottomNavigationBarThemeData get bottomNavigationBarThemeData;
}
