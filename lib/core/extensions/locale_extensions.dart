import 'package:flutter/widgets.dart';
import 'package:starter_app/l10n/l10n.dart';

extension LocalizationExt on BuildContext {
  /// Shorthand for localized strings
  S get loc => S.of(this);
}
