import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../widgets/cached_asset_image.dart';
import '../widgets/glass.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.idKey});

  final GlobalKey idKey;

  @override
  Widget build(BuildContext context) {
    final compact = context.isCompact;
    final education = PortfolioData.education;
    final profile = PortfolioData.profile;

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel(index: '04', title: 'About'),
        const SizedBox(height: 16),
        Text(
          'Built for the real world, not just the simulator.',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontSize: compact ? 30 : 40,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          profile.summary,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'I am a problem solver who pays very close attention to details, from API integrations to the last pixel. Payments have to hold. The UI has to match. The app has to stay fast on a cheap Android phone. When a product lives in the field, I go offline-first. That is a tool, not the whole story.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 28),
        Glass(
          radius: 22,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Education',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.accent,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(education.degree, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(education.school),
              Text('${education.period}  ·  ${education.place}'),
              const SizedBox(height: 16),
              Text(
                'Languages',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.accent,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(profile.languages.join('  ·  ')),
            ],
          ),
        ),
      ],
    );

    final portrait = Glass(
      radius: 28,
      padding: const EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return CachedAssetImage(
                'assets/images/about.jpg',
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                alignment: const Alignment(-0.35, 0),
              );
            },
          ),
        ),
      ),
    );

    return SectionShell(
      idKey: idKey,
      child: Reveal(
        child: compact
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  portrait,
                  const SizedBox(height: 28),
                  copy,
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: copy),
                  const SizedBox(width: 48),
                  Expanded(flex: 4, child: portrait),
                ],
              ),
      ),
    );
  }
}
