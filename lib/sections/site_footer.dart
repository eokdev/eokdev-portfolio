import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../utils/launchers.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final profile = PortfolioData.profile;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.sitePad,
        48,
        context.sitePad,
        36 + MediaQuery.paddingOf(context).bottom,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.siteMax),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(color: AppColors.border.withValues(alpha: 0.7)),
              const SizedBox(height: 22),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.center,
                runSpacing: 12,
                spacing: 16,
                children: [
                  Text(
                    '© $year ${profile.fullName}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Wrap(
                    spacing: 16,
                    children: [
                      _Link('GitHub', () => openUrl(profile.github)),
                      _Link('LinkedIn', () => openUrl(profile.linkedin)),
                      _Link('Email', () => openMail(profile.email)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Built with Flutter and Dart · Stays readable on a phone and a wide monitor.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  const _Link(this.label, this.onTap);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.accentSoft,
        ),
      ),
    );
  }
}
