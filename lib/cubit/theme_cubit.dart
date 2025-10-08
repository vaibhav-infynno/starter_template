import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/core/utils/preference_utils.dart';

import '../core/theme/app_theme.dart';
import '../core/theme/dark_theme.dart';
import '../core/theme/light_theme.dart';

extension ThemeExtension on BuildContext {
  AppColors get colors => read<ThemeCubit>().state.colors;
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppTheme get theme => read<ThemeCubit>().state;

  void changeTheme(AppTheme appTheme) {
    read<ThemeCubit>().changeThem(appTheme);
  }

  void toggleTheme() {
    read<ThemeCubit>().toggleTheme();
  }
}

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(LightTheme()) {
    _loadTheme();
  }

  Future<void> changeThem(AppTheme appTheme) async {
    setString('theme', appTheme.runtimeType.toString());
    emit(appTheme);
  }

  Future<void> toggleTheme() async {
    if (state is LightTheme) {
      setString('theme', 'DarkTheme');
      emit(DarkTheme());
    } else {
      setString('theme', 'LightTheme');
      emit(LightTheme());
    }
  }

  void _loadTheme() {
    final theme = getString('theme');
    switch (theme) {
      case 'DarkTheme':
        emit(DarkTheme());
      case 'LightTheme':
      default:
        emit(LightTheme());
    }
  }
}
