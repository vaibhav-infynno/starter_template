import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/core/helpers/extensions/responsive_extensions.dart';

import '../../cubit/locale_cubit.dart';
import '../../cubit/theme_cubit.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LocaleCubit, Locale?, String>(
      selector: (locale) => locale?.languageCode ?? "en",
      builder: (context, currentCode) {
        final options = [
          {"code": "en", "label": "A"},
          {"code": "hi", "label": "हि"},
          {"code": "gu", "label": "ગુ"},
        ];

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: options.map((option) {
            final isSelected = option["code"] == currentCode;
            return GestureDetector(
              onTap: () {
                if (!isSelected) {
                  context.read<LocaleCubit>().setLocale(
                    Locale(option["code"]!),
                  );
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.primary.withOpacity(0.1)
                      : context.colors.surface200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected
                        ? context.colors.primary
                        : Colors.transparent,
                    width: 1.2,
                  ),
                ),
                child: context.autoSizeText(
                  text: option["label"]!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? context.colors.primary : Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
