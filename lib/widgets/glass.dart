import 'dart:ui';

import 'package:flutter/foundation.dart';
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
    final content = DecoratedBox(
      decoration: BoxDecoration(
        color: tint ?? AppColors.glass,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: border ?? AppColors.border),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0x38F6E7C4),
            Color(0x14F6F0E6),
            Color(0x08C9A25A),
          ],
        ),
      ),
      child: padding == null ? child : Padding(padding: padding!, child: child),
    );

    final clipped = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: frosted && !kIsWeb
          ? BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: content,
            )
          : content,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 36,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: clipped,
    );
  }
}
