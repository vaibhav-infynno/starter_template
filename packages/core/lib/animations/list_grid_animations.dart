import 'package:flutter/material.dart';

import 'animation_constants.dart';

/// Staggered List Animation
class AnimatedListItem extends StatelessWidget {
  final Widget child;
  final int index;
  final Duration delay;
  final Duration duration;

  const AnimatedListItem({
    super.key,
    required this.child,
    required this.index,
    this.delay = const Duration(milliseconds: 50),
    this.duration = AppAnimations.medium,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay * index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: duration,
            curve: AppAnimations.defaultCurve,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, (1 - value) * 20),
                  child: child,
                ),
              );
            },
            child: child,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

/// Staggered Grid Animation
/// Staggered Grid Animation (Right to Left with Fade)
class AnimatedGridItem extends StatelessWidget {
  final Widget child;
  final int index;
  final Duration delay;
  final Duration duration;

  const AnimatedGridItem({
    super.key,
    required this.child,
    required this.index,
    this.delay = const Duration(milliseconds: 30),
    this.duration = AppAnimations.medium,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay * index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: duration,
            curve: AppAnimations.defaultCurve,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset((1 - value) * 30, 0), // Right to Left slide
                  child: child,
                ),
              );
            },
            child: child,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
