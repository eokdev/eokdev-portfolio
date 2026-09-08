import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class Glass extends StatelessWidget {
  const Glass({
    super.key,
    required this.child,
    this.padding,
    this.radius = 28,
    this.blur = 26,
    this.tint,
    this.border,
    this.frosted = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double radius;
  final double blur;
  final Color? tint;
  final Color? border;
  final bool frosted;

  @override
  Widget build(BuildContext context) {
    assert(blur >= 0);
    assert(!frosted || frosted);
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: tint ?? colors.card,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: border ?? colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: padding == null ? child : Padding(padding: padding!, child: child),
      ),
    );
  }
}
