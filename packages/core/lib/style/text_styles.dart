import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle headlineLarge = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headlineMedium = headlineLarge.copyWith(fontSize: 40);

  static TextStyle headlineSmall = headlineLarge.copyWith(fontSize: 32);

  static TextStyle displayLarge = headlineLarge.copyWith(fontSize: 24);

  static TextStyle displayMedium = displayLarge.copyWith(fontSize: 20);

  static TextStyle displaySmall = displayLarge.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle labelLarge = displaySmall.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  static TextStyle labelMedium = labelLarge.copyWith(
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelSmall = labelLarge.copyWith(
    fontWeight: FontWeight.w400,
  );

  static TextStyle titleLarge = labelSmall.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleMedium = titleLarge.copyWith(fontSize: 12);

  static TextStyle titleSmall = titleLarge.copyWith(fontSize: 10);

  static TextStyle bodyLarge = titleLarge.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  static TextStyle bodyMedium = titleLarge.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static TextStyle bodySmall = titleLarge.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
}
