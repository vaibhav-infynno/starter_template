import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Responsive {
  // Singleton pattern to ensure only one instance of Responsive
  static final Responsive _instance = Responsive._internal();
  factory Responsive() => _instance;
  Responsive._internal();

  // Base dimensions for scaling (reference screen size, e.g., iPhone 8)
  static const double baseWidth = 375.0;
  static const double baseHeight = 667.0;

  // Scaling factor based on screen size
  late double _scaleFactor;
  late double _scaleFactorHeight;

  // Initialize the responsive scaling based on the context
  void init(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    _scaleFactor = screenWidth / baseWidth;
    _scaleFactorHeight = screenHeight / baseHeight;
  }

  // Scale a value based on the screen width
  double scale(double value) => value * _scaleFactor;

  // Scale a value based on the screen height
  double scaleHeight(double value) => value * _scaleFactorHeight;

  // Scale padding
  EdgeInsets scalePadding(EdgeInsets padding) {
    return EdgeInsets.only(
      left: scale(padding.left),
      right: scale(padding.right),
      top: scaleHeight(padding.top),
      bottom: scaleHeight(padding.bottom),
    );
  }

  // Scale font size (returns a value to be used with AutoSizeText)
  double scaleFont(double fontSize) => fontSize * _scaleFactor;

  // Scale icon size
  double scaleIcon(double iconSize) => iconSize * _scaleFactor;

  // Scale border radius
  BorderRadius scaleBorderRadius(double radius) =>
      BorderRadius.circular(scale(radius));

  // Calculate crossAxisCount for GridView based on screen width
  int getCrossAxisCount(double minScreenWidthForThreeColumns) {
    return MediaQueryData.fromView(WidgetsBinding.instance.window).size.width <
            minScreenWidthForThreeColumns
        ? 2
        : 3;
  }

  // Calculate childAspectRatio for GridView dynamically
  double getChildAspectRatio({
    required int crossAxisCount,
    required double baseAspectRatio,
    required EdgeInsets padding,
    required double crossAxisSpacing,
  }) {
    final screenWidth = MediaQueryData.fromView(
      WidgetsBinding.instance.window,
    ).size.width;
    final scaledPadding = scalePadding(padding);
    final scaledCrossAxisSpacing = scale(crossAxisSpacing);
    final tileWidth =
        (screenWidth -
            scaledPadding.left -
            scaledPadding.right -
            scaledCrossAxisSpacing * (crossAxisCount - 1)) /
        crossAxisCount;
    return tileWidth / (tileWidth / baseAspectRatio);
  }

  // Wrap a Text widget with AutoSizeText for responsive text scaling
  Widget autoSizeText({
    required String text,
    required TextStyle style,
    TextAlign textAlign = TextAlign.left,
    int maxLines = 1,
    double minFontSize = 10.0,
    // double stepGranularity = 1.0,
  }) {
    return AutoSizeText(
      text,
      style: style.copyWith(fontSize: scaleFont(style.fontSize ?? 16.0)),
      textAlign: textAlign,
      maxLines: maxLines,
      minFontSize: minFontSize,

      // stepGranularity: stepGranularity,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Get scaled padding for common use cases
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: scale(16));
  EdgeInsets get verticalPadding =>
      EdgeInsets.symmetric(vertical: scaleHeight(8));
  EdgeInsets get symmetricPadding =>
      EdgeInsets.symmetric(horizontal: scale(16), vertical: scaleHeight(8));

  // Get scaled spacing for common use cases
  double get smallSpacing => scaleHeight(8);
  double get mediumSpacing => scaleHeight(15);
  double get largeSpacing => scaleHeight(30);
  double get largeMediumSpacing => scaleHeight(40);
  double get extraLargeSpacing => scaleHeight(50);
}
