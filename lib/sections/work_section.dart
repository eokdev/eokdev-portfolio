import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../widgets/glass.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';
import '../widgets/cached_asset_image.dart';
import '../widgets/store_links.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key, required this.idKey});

  final GlobalKey idKey;

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects;
    final compact = context.isCompact;

    return SectionShell(
      idKey: idKey,
      top: compact ? 28 : 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Reveal(
            child: SectionLabel(index: '01', title: 'Selected work'),
          ),
          const SizedBox(height: 16),
          Reveal(
            child: Text(
              'Apps in production.',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: compact ? 30 : 42,
              ),
            ),
          ),
          const SizedBox(height: 36),
          for (var i = 0; i < projects.length; i++)
            Reveal(
              delay: Duration(milliseconds: 24 * i.clamp(0, 6)),
              child: RepaintBoundary(
                child: _FeaturedCard(project: projects[i]),
              ),
            ),
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatefulWidget {
  const _FeaturedCard({required this.project});

  final Project project;

  @override
  State<_FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<_FeaturedCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final compact = context.isCompact;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Glass(
          radius: 28,
          tint: _hover ? AppColors.glassHeavy : AppColors.glass,
          border: _hover
              ? AppColors.accentSoft.withValues(alpha: 0.45)
              : AppColors.border,
          padding: EdgeInsets.all(compact ? 22 : 30),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.index,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              project.category,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 18),
            Text(
              project.name,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: compact ? 28 : 36,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              project.blurb,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.muted,
              ),
            ),
            if (project.screenshots.isNotEmpty) ...[
              const SizedBox(height: 20),
              ScreenshotStrip(paths: project.screenshots),
              const SizedBox(height: 8),
            ],
            const SizedBox(height: 18),
            for (final line in project.highlights)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.north_east,
                        size: 12,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        line,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tag in project.tags) _Tag(tag),
              ],
            ),
            const SizedBox(height: 18),
            StoreLinks(project: project),
          ],
        ),
        ),
      ),
    );
  }
}

class ScreenshotStrip extends StatelessWidget {
  const ScreenshotStrip({super.key, required this.paths});

  final List<String> paths;

  @override
  Widget build(BuildContext context) {
    final height = context.isCompact ? 240.0 : 300.0;
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        cacheExtent: 280,
        addAutomaticKeepAlives: false,
        itemCount: paths.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedAssetImage(
              paths[index],
              height: height,
              fit: BoxFit.fitHeight,
            ),
          );
        },
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.glass,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: 11,
          color: AppColors.muted,
        ),
      ),
    );
  }
}
