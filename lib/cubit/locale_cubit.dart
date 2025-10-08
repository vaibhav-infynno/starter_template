import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/utils/preference_utils.dart';

class LocaleCubit extends Cubit<Locale?> {
  static const String _localeKey = "selected_locale";

  LocaleCubit() : super(null) {
    loadSavedLocale();
  }

  Future<void> setLocale(Locale locale) async {
    if (state?.languageCode == locale.languageCode) return;
    await setString(_localeKey, locale.languageCode);
    emit(locale);
  }

  Future<void> loadSavedLocale() async {
    final langCode = getString(_localeKey, "en");
    if (langCode.isNotEmpty) {
      emit(Locale(langCode));
    }
  }

  Future<void> clearLocale() async {
    await remove(_localeKey);
    emit(null);
  }
}
