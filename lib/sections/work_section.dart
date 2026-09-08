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

  static List<Widget> slivers({required GlobalKey idKey}) {
    return [
      _WorkHeaderSliver(idKey: idKey),
      const _WorkListSliver(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _WorkHeader(idKey: idKey),
        const SizedBox(height: 36),
        for (final project in PortfolioData.projects)
          _FeaturedCard(project: project),
      ],
    );
  }
}

class _WorkHeaderSliver extends StatelessWidget {
  const _WorkHeaderSliver({required this.idKey});

  final GlobalKey idKey;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(
        context.sitePad,
        context.isCompact ? 28 : 40,
        context.sitePad,
        0,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.siteMax),
            child: SizedBox(
              width: double.infinity,
              child: _WorkHeader(idKey: idKey),
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkListSliver extends StatelessWidget {
  const _WorkListSliver();

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects;
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(
        context.sitePad,
        36,
        context.sitePad,
        24,
      ),
      sliver: SliverList.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.siteMax),
              child: Reveal(
                delay: Duration(milliseconds: 40 * (index % 4)),
                child: RepaintBoundary(
                  child: _FeaturedCard(project: projects[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WorkHeader extends StatelessWidget {
  const _WorkHeader({required this.idKey});

  final GlobalKey idKey;

  @override
  Widget build(BuildContext context) {
    final compact = context.isCompact;
    return KeyedSubtree(
      key: idKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel(index: '01', title: 'Selected work'),
          const SizedBox(height: 16),
          Text(
            'Apps in production.',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: compact ? 30 : 42,
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

    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Glass(
          radius: 28,
          tint: _hover ? colors.surfaceHigh : colors.card,
          border: _hover ? colors.olive.withValues(alpha: 0.35) : colors.border,
          padding: EdgeInsets.all(compact ? 18 : (context.isMedium ? 24 : 30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.index,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: colors.accent,
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
                  color: colors.muted,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.north_east,
                          size: 12,
                          color: colors.accent,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          line,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colors.text,
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
    final height = context.isCompact
        ? 200.0
        : context.isMedium
        ? 260.0
        : 300.0;
    return SizedBox(
      height: height,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          cacheExtent: 80,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: true,
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
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colors.bgElevated,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colors.border),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: 11,
          color: colors.muted,
        ),
      ),
    );
  }
}
