import 'dart:async';

import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../utils/play_downloads.dart';
import '../widgets/cached_asset_image.dart';
import '../widgets/glass.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.idKey,
    required this.onViewWork,
    required this.onContact,
  });

  final GlobalKey idKey;
  final VoidCallback onViewWork;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final compact = context.isCompact;
    final nameSize = compact ? 52.0 : (context.isMedium ? 76.0 : 96.0);
    final profile = PortfolioData.profile;

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${profile.title.toUpperCase()}  ·  ${profile.location.toUpperCase()}',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.accent,
            letterSpacing: 2.4,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 22),
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            profile.firstName,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: nameSize,
            ),
          ),
        ),
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            profile.lastName,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: nameSize,
              color: AppColors.accentSoft,
            ),
          ),
        ),
        const SizedBox(height: 28),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(
            'I design and ship production Flutter apps for Android and iOS. Marketplaces, ecommerce, fintech, health, social, operations, or whatever the brief is. If it is buildable, I will build it.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: compact ? 17 : 20,
              color: AppColors.muted,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            IosButton(label: 'See selected work', onPressed: onViewWork),
            IosButton(
              label: 'Get in touch',
              filled: false,
              onPressed: onContact,
            ),
          ],
        ),
      ],
    );

    return SectionShell(
      idKey: idKey,
      top: compact ? 28 : 48,
      bottom: 24,
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (compact) ...[
              const _HeroPortrait(maxWidth: 220),
              const SizedBox(height: 28),
              copy,
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 6, child: copy),
                  const SizedBox(width: 40),
                  const Expanded(flex: 4, child: _HeroPortrait()),
                ],
              ),
            const SizedBox(height: 56),
            _StatsRow(compact: compact),
          ],
        ),
      ),
    );
  }
}

class _HeroPortrait extends StatelessWidget {
  const _HeroPortrait({this.maxWidth});

  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    final frame = Glass(
      radius: 28,
      padding: const EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return CachedAssetImage(
                'assets/images/avatar.jpg',
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                alignment: const Alignment(-0.2, -0.12),
              );
            },
          ),
        ),
      ),
    );

    if (maxWidth == null) return frame;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth!),
        child: frame,
      ),
    );
  }
}

class _StatsRow extends StatefulWidget {
  const _StatsRow({required this.compact});

  final bool compact;

  @override
  State<_StatsRow> createState() => _StatsRowState();
}

class _StatsRowState extends State<_StatsRow> {
  late final List<Stat> _stats;
  Timer? _refresh;

  @override
  void initState() {
    super.initState();
    _stats = List<Stat>.from(PortfolioData.stats);
    if (skipLiveDownloads) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future<void>.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        _refreshDownloads();
        _refresh = Timer.periodic(const Duration(minutes: 10), (_) {
          _refreshDownloads();
        });
      });
    });
  }

  @override
  void dispose() {
    _refresh?.cancel();
    super.dispose();
  }

  Future<void> _refreshDownloads() async {
    try {
      final total = await fetchPortfolioDownloads();
      if (!mounted) return;
      final formatted = formatDownloadTotal(total);
      setState(() {
        for (var i = 0; i < _stats.length; i++) {
          if (_stats[i].liveDownloads) {
            _stats[i] = Stat(
              value: formatted,
              label: _stats[i].label,
              liveDownloads: true,
            );
          }
        }
      });
    } catch (_) {
      // Keep the last known total on screen.
    }
  }

  @override
  Widget build(BuildContext context) {
    final stats = _stats;
    if (widget.compact) {
      return Glass(
        radius: 22,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          children: [
            for (var i = 0; i < stats.length; i += 2)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(child: _StatCell(stat: stats[i])),
                    if (i + 1 < stats.length)
                      Expanded(child: _StatCell(stat: stats[i + 1])),
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return Glass(
      radius: 22,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Row(
        children: [
          for (final stat in stats)
            Expanded(child: _StatCell(stat: stat)),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({required this.stat});

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stat.value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 4),
        Text(stat.label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
