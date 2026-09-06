import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, required this.idKey});

  final GlobalKey idKey;

  @override
  Widget build(BuildContext context) {
    final compact = context.isCompact;

    return SectionShell(
      idKey: idKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Reveal(
            child: SectionLabel(index: '02', title: 'Experience'),
          ),
          const SizedBox(height: 16),
          Reveal(
            child: Text(
              'Where the work happened.',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: compact ? 30 : 42,
              ),
            ),
          ),
          const SizedBox(height: 36),
          for (var i = 0; i < PortfolioData.roles.length; i++)
            Reveal(
              delay: Duration(milliseconds: 50 * i),
              child: _RoleTile(
                role: PortfolioData.roles[i],
                last: i == PortfolioData.roles.length - 1,
              ),
            ),
        ],
      ),
    );
  }
}

class _RoleTile extends StatelessWidget {
  const _RoleTile({required this.role, required this.last});

  final Role role;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: last ? 0 : 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role.period,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.accentSoft,
                  ),
                ),
                const SizedBox(height: 6),
                Text(role.company, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(
                  '${role.title}  ·  ${role.mode}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  role.summary,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 12),
                for (final item in role.highlights)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '•  ',
                          style: TextStyle(color: AppColors.accent),
                        ),
                        Expanded(
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.text),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
