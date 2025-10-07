import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/core/extensions/locale_extensions.dart';
import 'package:starter_app/core/routes/app_router.dart';
import 'package:starter_app/core/selector/language_switcher.dart';
import 'package:starter_app/core/theme/theme_cubit.dart';
import 'package:starter_app/core/utils/preference_utils.dart';
import 'package:starter_app/core/utils/responsive.dart';

import '../../core/theme/dark_theme.dart';
import '../../core/utils/show_snackbar.dart';
import '../../cubit/internet_cubit.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive()..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [LanguageSwitcher(responsive: responsive)],
      ),
      body: Padding(
        padding: responsive.symmetricPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Locale: ${context.loc.localeName}',
              style: context.textTheme.displayLarge?.copyWith(
                color: context.colors.primary,
                fontSize: responsive.scaleFont(24),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.mediumSpacing),
            CupertinoSwitch(
              value: context.theme is DarkTheme,
              onChanged: (value) => context.toggleTheme(),
              activeTrackColor: context.colors.primary,
              thumbColor: context.colors.background,
            ),
            SizedBox(height: responsive.mediumSpacing),
            BlocSelector<InternetCubit, InternetState, bool>(
              selector: (state) {
                if (state.isConnected) {
                  return true;
                }
                return false;
              },
              builder: (context, isConnected) {
                return Text(
                  isConnected ? 'Connected' : 'Disconnected',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: isConnected
                        ? context.colors.success
                        : context.colors.error,
                    fontSize: responsive.scaleFont(16),
                  ),
                );
              },
            ),
            SizedBox(height: responsive.mediumSpacing),
            FilledButton(
              onPressed: () async {
                try {
                  await setBool('isOnboarded', true);
                  log('Onboarding status saved as true');
                  if (context.mounted) {
                    log('Onboarding completed, navigating to Login');
                    await context.router.push(const LoginRoute());
                  }
                } catch (e) {
                  if (context.mounted) {
                    showFlushbar(
                      context: context,
                      message: 'Failed to save onboarding status: $e',
                      isError: true,
                    );
                  }
                }
              },
              style: context.theme.filledButtonTheme.style?.copyWith(
                minimumSize: WidgetStateProperty.all(
                  Size(responsive.scale(200), responsive.scaleHeight(48)),
                ),
              ),
              child: Text(
                'Next',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colors.buttonTextColor,
                  fontSize: responsive.scaleFont(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
