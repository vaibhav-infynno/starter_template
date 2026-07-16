import 'package:flutter/material.dart';

/// A simple and consistent loader widget used throughout the app.
class AppLoader extends StatelessWidget {
  final double size;
  final Color? color;
  final String? message;
  final bool center;

  const AppLoader({
    super.key,
    this.size = 32,
    this.color,
    this.message,
    this.center = true,
  });

  @override
  Widget build(BuildContext context) {
    final loader = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(
              color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: 12),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );

    return center ? Center(child: loader) : loader;
  }
}
