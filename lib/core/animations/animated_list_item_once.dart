import 'package:flutter/widgets.dart';

import 'animation_constants.dart';

class AnimatedListItemOnce extends StatefulWidget {
  final Widget child;
  final int index;
  final Duration delay;
  final Duration duration;

  const AnimatedListItemOnce({
    super.key,
    required this.child,
    required this.index,
    this.delay = const Duration(milliseconds: 50),
    this.duration = AppAnimations.medium,
  });

  @override
  State<AnimatedListItemOnce> createState() => _AnimatedListItemOnceState();
}

class _AnimatedListItemOnceState extends State<AnimatedListItemOnce>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay * widget.index, () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: widget.duration,
      curve: AppAnimations.defaultCurve,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, 0.1),
        duration: widget.duration,
        curve: AppAnimations.defaultCurve,
        child: widget.child,
      ),
    );
  }
}
