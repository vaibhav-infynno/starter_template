import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

extension ResponsiveContext on BuildContext {
  Responsive get _responsive => Responsive();

  // Must call this once in build() of your top-level widget (like Scaffold)
  void initResponsive() => _responsive.init(this);

  // Width & height scaling
  double scale(double value) => _responsive.scale(value);
  double scaleHeight(double value) => _responsive.scaleHeight(value);

  // Font & icon scaling
  double scaleFont(double fontSize) => _responsive.scaleFont(fontSize);
  double scaleIcon(double iconSize) => _responsive.scaleIcon(iconSize);

  // Padding scaling
  EdgeInsets scalePadding(EdgeInsets padding) =>
      _responsive.scalePadding(padding);

  // Border radius scaling
  BorderRadius scaleBorderRadius(double radius) =>
      _responsive.scaleBorderRadius(radius);

  // GridView helpers
  int getCrossAxisCount(double minWidth) =>
      _responsive.getCrossAxisCount(minWidth);
  double getChildAspectRatio({
    required int crossAxisCount,
    required double baseAspectRatio,
    required EdgeInsets padding,
    required double crossAxisSpacing,
  }) => _responsive.getChildAspectRatio(
    crossAxisCount: crossAxisCount,
    baseAspectRatio: baseAspectRatio,
    padding: padding,
    crossAxisSpacing: crossAxisSpacing,
  );

  // AutoSizeText wrapper
  Widget autoSizeText({
    required String text,
    required TextStyle style,
    TextAlign textAlign = TextAlign.left,
    int maxLines = 1,
    double minFontSize = 10.0,
  }) => _responsive.autoSizeText(
    text: text,
    style: style,
    textAlign: textAlign,
    maxLines: maxLines,
    minFontSize: minFontSize,
  );

  // Common paddings
  EdgeInsets get horizontalPadding => _responsive.horizontalPadding;
  EdgeInsets get verticalPadding => _responsive.verticalPadding;
  EdgeInsets get symmetricPadding => _responsive.symmetricPadding;

  // Common spacings
  double get smallSpacing => _responsive.smallSpacing;
  double get mediumSpacing => _responsive.mediumSpacing;
  double get largeSpacing => _responsive.largeSpacing;
  double get largeMediumSpacing => _responsive.largeMediumSpacing;
  double get extraLargeSpacing => _responsive.extraLargeSpacing;
}
