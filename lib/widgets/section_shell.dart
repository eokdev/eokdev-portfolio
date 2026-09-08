import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/layout.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.idKey,
    required this.child,
    this.top,
    this.bottom = 24,
  });

  final GlobalKey idKey;
  final Widget child;
  final double? top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    final sectionTop = top ?? (context.isCompact ? 28.0 : 40.0);
    return KeyedSubtree(
      key: idKey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.sitePad,
          sectionTop,
          context.sitePad,
          bottom,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.siteMax),
            child: SizedBox(width: double.infinity, child: child),
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
    return Text(
      '$index  ${title.toUpperCase()}',
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: context.colors.muted,
        letterSpacing: 1.6,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class CardLabel extends StatelessWidget {
  const CardLabel(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: context.colors.muted,
        letterSpacing: 1.5,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
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
    final colors = context.colors;
    final style = filled
        ? FilledButton.styleFrom(
            backgroundColor: colors.ink,
            foregroundColor: colors.onInk,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
          )
        : OutlinedButton.styleFrom(
            foregroundColor: colors.text,
            side: BorderSide(color: colors.border),
            backgroundColor: colors.bgElevated,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
          );

    final child = Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: filled ? colors.onInk : colors.text,
        fontWeight: FontWeight.w600,
      ),
    );

    return filled
        ? FilledButton(onPressed: onPressed, style: style, child: child)
        : OutlinedButton(onPressed: onPressed, style: style, child: child);
  }
}
