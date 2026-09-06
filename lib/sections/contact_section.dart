import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../utils/launchers.dart';
import '../widgets/glass.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.idKey});

  final GlobalKey idKey;

  @override
  Widget build(BuildContext context) {
    final compact = context.isCompact;
    final profile = PortfolioData.profile;

    return SectionShell(
      idKey: idKey,
      child: Reveal(
        child: Glass(
          radius: 32,
          blur: 28,
          tint: AppColors.glassHeavy,
          padding: EdgeInsets.all(compact ? 24 : 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionLabel(index: '05', title: 'Contact'),
              const SizedBox(height: 16),
              Text(
                'Let us build the next one.',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: compact ? 30 : 44,
                ),
              ),
              const SizedBox(height: 14),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Text(
                  'I am open to Flutter roles, contract work, and products that need a mobile engineer who has already shipped at scale.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.muted,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  IosButton(
                    label: 'Email me',
                    onPressed: () => openMail(
                      profile.email,
                      subject: 'Hello Emmanuel, Flutter work',
                    ),
                  ),
                  IosButton(
                    label: 'Download resume',
                    filled: false,
                    onPressed: openResume,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  _ContactLine(
                    label: 'Email',
                    value: profile.email,
                    onTap: () => openMail(profile.email),
                    onCopy: () => _copy(context, profile.email),
                  ),
                  for (final phone in profile.phones)
                    _ContactLine(
                      label: 'Phone',
                      value: phone,
                      onTap: () => openTel(phone),
                      onCopy: () => _copy(context, phone),
                    ),
                  _ContactLine(
                    label: 'GitHub',
                    value: 'github.com/eokdev',
                    onTap: () => openUrl(profile.github),
                  ),
                  _ContactLine(
                    label: 'LinkedIn',
                    value: 'Emmanuel Olorunshola',
                    onTap: () => openUrl(profile.linkedin),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _copy(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied $value'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xEE0C1830),
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  const _ContactLine({
    required this.label,
    required this.value,
    required this.onTap,
    this.onCopy,
  });

  final String label;
  final String value;
  final VoidCallback onTap;
  final VoidCallback? onCopy;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onCopy,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 11,
                letterSpacing: 1.4,
                color: AppColors.accentSoft,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.border,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
