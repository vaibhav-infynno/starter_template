import 'package:flutter/material.dart';

import '../style/text_styles.dart';
import 'app_theme.dart';

class DarkTheme extends AppTheme {
  @override
  AppColors get colors => DarkColors();

  @override
  FilledButtonThemeData get filledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: colors.primary,
      foregroundColor: colors.buttonTextColor,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      textStyle: TextStyles.titleLarge,
      disabledBackgroundColor: colors.surface700,
      disabledForegroundColor: colors.primary,
    ),
  );

  @override
  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
    style:
        OutlinedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.buttonTextColor,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyles.titleLarge,
          disabledForegroundColor: colors.surface700,
        ).copyWith(
          side: WidgetStateBorderSide.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(color: colors.surface600);
            }
            return BorderSide(color: colors.primary);
          }),
        ),
  );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: colors.surface900,
    suffixIconColor: colors.surface300,
    labelStyle: TextStyles.labelMedium.copyWith(
      color: colors.surface400,
      fontWeight: FontWeight.w400,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: colors.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.transparent),
    ),
  );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
    backgroundColor: colors.background,
    foregroundColor: colors.surface900,
    titleTextStyle: TextStyles.labelMedium,
  );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      BottomNavigationBarThemeData(
        backgroundColor: colors.background,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.surface500,
        selectedLabelStyle: TextStyles.bodySmall,
        unselectedLabelStyle: TextStyles.bodySmall,
      );

  @override
  TextTheme get textTheme => TextTheme(
    headlineLarge: TextStyles.headlineLarge,
    headlineMedium: TextStyles.headlineMedium,
    headlineSmall: TextStyles.headlineSmall,
    displayLarge: TextStyles.displayLarge,
    displayMedium: TextStyles.displayMedium,
    displaySmall: TextStyles.displaySmall,
    labelLarge: TextStyles.labelLarge,
    labelMedium: TextStyles.labelMedium,
    labelSmall: TextStyles.labelSmall,
    titleLarge: TextStyles.titleLarge,
    titleMedium: TextStyles.titleMedium,
    titleSmall: TextStyles.titleSmall,
    bodyLarge: TextStyles.bodyLarge,
    bodyMedium: TextStyles.bodyMedium,
    bodySmall: TextStyles.bodySmall,
  );

  @override
  ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: colors.background,
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: colors.background,
      foregroundColor: colors.surface50,
      titleTextStyle: TextStyles.labelMedium,
    ),
    filledButtonTheme: filledButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
  );
}

class DarkColors extends AppColors {
  @override
  Color get primary => const Color(0xFFFFFFFF); // white
  @override
  Color get primary2nd => const Color(0xFFF5F5F5); // light white

  @override
  Color get primary3rd => const Color(0xFFE0E0E0); // lighter gray

  @override
  Color get primary4th => const Color(0xFFBDBDBD); // light gray

  @override
  Color get primary5th => const Color(0xFF9E9E9E); // medium gray

  @override
  Color get primary6th => const Color(0xFF757575); // dark gray

  @override
  Color get secondary => const Color(0xFFFAFAFA); // accent white

  @override
  Color get secondary2nd => const Color(0xFFF0F0F0);

  @override
  Color get secondary3rd => const Color(0xFFE8E8E8);

  @override
  Color get secondary4th => const Color(0xFFD6D6D6);

  @override
  Color get secondary5th => const Color(0xFFB0B0B0);

  @override
  Color get secondary6th => const Color(0xFF8C8C8C);

  @override
  Color get success => const Color(0xFF22C55E);

  @override
  Color get warning => const Color(0xFFFACC15);

  @override
  Color get error => const Color(0xFFEF4444);

  @override
  Color get surface => const Color(0xFF0F172A);

  @override
  Color get surface50 => const Color(0xFF1E293B);

  @override
  Color get surface100 => const Color(0xFF334155);

  @override
  Color get surface200 => const Color(0xFF475569);

  @override
  Color get surface300 => const Color(0xFF64748B);

  @override
  Color get surface400 => const Color(0xFF94A3B8);

  @override
  Color get surface500 => const Color(0xFFCBD5E1);

  @override
  Color get surface600 => const Color(0xFFE2E8F0);

  @override
  Color get surface700 => const Color(0xFFF8FAFC);

  @override
  Color get surface800 => const Color(0xFFFEFEFE);

  @override
  Color get surface900 => const Color(0xFFFFFFFF);

  @override
  Color get background => const Color(0xFF0F172A);

  @override
  Color get buttonTextColor => const Color(0xFF0F172A);
}
