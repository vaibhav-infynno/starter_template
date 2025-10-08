import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/core/helpers/extensions/locale_extensions.dart';
import 'package:starter_app/core/helpers/extensions/responsive_extensions.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

import '../../core/routes/app_router.dart';
import '../../core/selector/language_switcher.dart';
import '../../core/theme/dark_theme.dart';
import '../../core/utils/preference_utils.dart';
import '../../core/utils/show_snackbar.dart';
import '../../cubit/internet/internet_cubit.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.welcome,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [LanguageSwitcher()],
      ),
      body: Padding(
        padding: context.symmetricPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Locale: ${context.loc.localeName}',
              style: context.textTheme.displayLarge?.copyWith(
                color: context.colors.primary,
                fontSize: context.scaleFont(24),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.mediumSpacing),
            CupertinoSwitch(
              value: context.theme is DarkTheme,
              onChanged: (value) => context.toggleTheme(),
              activeTrackColor: context.colors.primary,
              thumbColor: context.colors.background,
            ),
            SizedBox(height: context.mediumSpacing),
            BlocSelector<InternetCubit, InternetState, bool>(
              selector: (state) {
                if (state.isConnected) {
                  return true;
                }
                return false;
              },
              builder: (context, isConnected) {
                return Text(
                  isConnected
                      ? context.loc.connected
                      : context.loc.disconnected,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: isConnected
                        ? context.colors.success
                        : context.colors.error,
                    fontSize: context.scaleFont(16),
                  ),
                );
              },
            ),
            SizedBox(height: context.mediumSpacing),
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
                  Size(context.scale(200), context.scaleHeight(48)),
                ),
              ),
              child: Text(
                'Next',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colors.buttonTextColor,
                  fontSize: context.scaleFont(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
