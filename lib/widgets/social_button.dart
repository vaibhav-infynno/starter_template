import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

import '../core/style/text_styles.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.onTap,
    required this.label,
    required this.iconPath,
    this.onlyIcon = false,
    super.key,
  });

  factory SocialButton.google({
    required VoidCallback onTap,
    bool onlyIcon = false,
  }) {
    return SocialButton(
      onTap: onTap,
      label: 'Login with Google',
      iconPath: 'assets/icons/google.svg',
      onlyIcon: onlyIcon,
    );
  }

  factory SocialButton.apple({
    required VoidCallback onTap,
    bool onlyIcon = false,
  }) {
    return SocialButton(
      onTap: onTap,
      label: 'Login with Apple',
      iconPath: 'assets/icons/apple.svg',
      onlyIcon: onlyIcon,
    );
  }

  factory SocialButton.email({
    required VoidCallback onTap,
    bool onlyIcon = false,
  }) {
    return SocialButton(
      onTap: onTap,
      label: 'Login with email',
      iconPath: 'assets/icons/email.svg',
      onlyIcon: onlyIcon,
    );
  }

  final VoidCallback onTap;
  final String label;
  final String iconPath;
  final bool onlyIcon;

  @override
  Widget build(BuildContext context) {
    if (onlyIcon) {
      return IconButton(
        onPressed: onTap,
        icon: SvgPicture.asset(iconPath),
        style: FilledButton.styleFrom(
          backgroundColor: context.colors.surface100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.golf_course, size: 24),
      label: Text(
        label,
        style: TextStyles.titleLarge.copyWith(
          color: context.colors.secondary2nd,
        ),
      ),
      style: FilledButton.styleFrom(
        side: BorderSide(color: context.colors.surface200),
      ),
    );
  }
}
