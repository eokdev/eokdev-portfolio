import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/launchers.dart';

class StoreLinks extends StatelessWidget {
  const StoreLinks({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    if (project.internal) {
      return const _Chip(
        icon: Icons.lock_outline,
        label: 'Internal use',
      );
    }

    final links = <Widget>[
      if (project.androidUrl != null)
        _Chip(
          icon: Icons.android_outlined,
          label: 'Android',
          onTap: () => openUrl(project.androidUrl!),
        ),
      if (project.iosUrl != null)
        _Chip(
          icon: Icons.phone_iphone,
          label: 'iOS',
          onTap: () => openUrl(project.iosUrl!),
        ),
    ];

    if (links.isEmpty) {
      return const _Chip(
        icon: Icons.smartphone_outlined,
        label: 'Shipped on stores',
      );
    }

    return Wrap(spacing: 8, runSpacing: 8, children: links);
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final child = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colors.bgElevated,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: colors.accent),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 12,
              color: colors.text,
            ),
          ),
        ],
      ),
    );

    if (onTap == null) return child;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: child,
    );
  }
}
