import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: context.textTheme.labelLarge),
        // actions: [
        //   CupertinoSwitch(
        //     value: context.theme is DarkTheme,
        //     onChanged: (value) => context.toggleTheme(),
        //     activeTrackColor: context.colors.primary,
        //     thumbColor: context.colors.background,
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Center(
            child: Text('Login Page', style: context.textTheme.displayLarge),
          ),

          BlocSelector<ThemeCubit, AppTheme, bool>(
            selector: (state) => state is DarkTheme,
            builder: (context, isDark) {
              return CupertinoSwitch(
                thumbIcon: WidgetStateProperty.all(
                  Icon(
                    isDark ? Icons.nightlight_round : Icons.wb_sunny,
                    color: isDark ? Colors.yellow : Colors.orange,
                  ),
                ),
                value: isDark,
                onChanged: (value) => context.toggleTheme(),
                activeTrackColor: context.colors.primary,
                thumbColor: context.colors.background,
              );
            },
          ),
        ],
      ),
    );
  }
}
