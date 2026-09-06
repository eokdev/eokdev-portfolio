import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/layout.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.idKey,
    required this.child,
    this.top = 88,
    this.bottom = 40,
  });

  final GlobalKey idKey;
  final Widget child;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: idKey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.sitePad,
          top,
          context.sitePad,
          bottom,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.siteMax),
            child: child,
          ),
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel({super.key, required this.index, required this.title});

  final String index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          index,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.accent,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(width: 12),
        Container(width: 22, height: 1, color: AppColors.accentSoft.withValues(alpha: 0.7)),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.muted,
            letterSpacing: 1.6,
            fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class IosButton extends StatelessWidget {
  const IosButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = true,
  });

  final String label;
  final VoidCallback onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final style = filled
        ? FilledButton.styleFrom(
            backgroundColor: AppColors.accentSoft,
            foregroundColor: AppColors.ink,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
          )
        : OutlinedButton.styleFrom(
            foregroundColor: AppColors.text,
            side: const BorderSide(color: AppColors.border),
            backgroundColor: AppColors.glass,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
          );

    final child = Text(label);

    return filled
        ? FilledButton(onPressed: onPressed, style: style, child: child)
        : OutlinedButton(onPressed: onPressed, style: style, child: child);
  }
}
