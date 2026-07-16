// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class SHi extends S {
  SHi([String locale = 'hi']) : super(locale);

  @override
  String get hello => 'नमस्ते';

  @override
  String get welcome => 'वेंडॉक्स में आपका स्वागत है';

  @override
  String get connected => 'जुड़ा हुआ';

  @override
  String get disconnected => 'अजुड़ा हुआ';
}
