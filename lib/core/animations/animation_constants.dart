import 'package:flutter/material.dart';

/// Global animation settings
class AppAnimations {
  static const Duration short = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 400);
  static const Duration long = Duration(milliseconds: 600);

  static const Curve defaultCurve = Curves.easeInOut;
}
