import 'dart:async';

import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../utils/play_downloads.dart';
import '../widgets/abuja_map.dart';
import '../widgets/cached_asset_image.dart';
import '../widgets/glass.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';

class BentoSection extends StatelessWidget {
  const BentoSection({super.key, required this.onViewWork});

  final VoidCallback onViewWork;

  @override
  Widget build(BuildContext context) {
    final compact = context.isCompact;
    final gap = compact ? 12.0 : 16.0;

    final experience = const Reveal(child: _ExperienceCard());
    final apps = Reveal(
      delay: const Duration(milliseconds: 40),
      child: _AppsCard(onViewWork: onViewWork),
    );
    const numbers = Reveal(
      delay: Duration(milliseconds: 80),
      child: _NumbersCard(),
    );
    const map = Reveal(
      delay: Duration(milliseconds: 120),
      child: _MapCard(),
    );
    const process = Reveal(
      delay: Duration(milliseconds: 160),
      child: _HowIWorkCard(),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < 640) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              experience,
              SizedBox(height: gap),
              apps,
              SizedBox(height: gap),
              numbers,
              SizedBox(height: gap),
              map,
              SizedBox(height: gap),
              process,
            ],
          );
        }

        if (width < 1040) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _BentoRow(gap: gap, children: [experience, apps]),
              SizedBox(height: gap),
              _BentoRow(gap: gap, children: [numbers, map]),
              SizedBox(height: gap),
              process,
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _BentoRow(gap: gap, children: [experience, apps, numbers]),
            SizedBox(height: gap),
            SizedBox(
              height: _mapRowHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: map),
                  SizedBox(width: gap),
                  Expanded(flex: 2, child: process),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BentoRow extends StatelessWidget {
  const _BentoRow({
    required this.children,
    required this.gap,
    this.flex,
  });

  final List<Widget> children;
  final List<int>? flex;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) SizedBox(width: gap),
          Expanded(
            flex: flex != null && i < flex!.length ? flex![i] : 1,
            child: children[i],
          ),
        ],
      ],
    );
  }
}

String _shortCompany(String name) {
  if (name.startsWith('Tractrac')) return 'Tractrac';
  if (name.startsWith('Blending')) return 'Blending Bytes';
  if (name.startsWith('Ruban')) return 'Ruban';
  return name;
}

const _mapRowHeight = 280.0;

EdgeInsets _bentoPad(BuildContext context) {
  return EdgeInsets.fromLTRB(
    context.isCompact ? 20 : 28,
    context.isCompact ? 20 : 26,
    context.isCompact ? 20 : 28,
    context.isCompact ? 18 : 24,
  );
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard();

  @override
  Widget build(BuildContext context) {
    final roles = PortfolioData.roles;

    return Glass(
      radius: 28,
      padding: _bentoPad(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardLabel('My Experience'),
          const SizedBox(height: 22),
          for (var i = 0; i < roles.length; i++) ...[
            _TimelineRole(role: roles[i], active: i == 0),
            if (i != roles.length - 1) const SizedBox(height: 18),
          ],
        ],
      ),
    );
  }
}

class _TimelineRole extends StatelessWidget {
  const _TimelineRole({required this.role, required this.active});

  final Role role;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final year = role.period.contains('Present')
        ? 'Now'
        : role.company.startsWith('Ruban')
            ? '2022'
            : (RegExp(r'(\d{4})(?!.*\d)').firstMatch(role.period)?.group(1) ??
                  role.period);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: active ? context.colors.ink : context.colors.border,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                role.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${_shortCompany(role.company)}  ·  ${role.mode.split('·').first.trim()}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Text(
          year,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _AppsCard extends StatelessWidget {
  const _AppsCard({required this.onViewWork});

  final VoidCallback onViewWork;

  @override
  Widget build(BuildContext context) {
    final covers = PortfolioData.selectedAppCovers;
    final shown = covers.length <= 8
        ? covers
        : covers.sublist(covers.length - 8);
    final mid = (shown.length - 1) / 2;
    final compact = context.isCompact;

    final inset = compact ? 20.0 : 28.0;
    return Glass(
      radius: compact ? 24 : 28,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(inset, compact ? 20 : 26, inset, 0),
            child: const CardLabel('Selected apps'),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final scale = (constraints.maxWidth / 300).clamp(0.7, 1.0);
              final spread = 18.0 * scale;
              final phoneW = 112.0 * scale;
              final phoneH = 196.0 * scale;
              final fanWidth = phoneW + (shown.length - 1) * spread;
              return SizedBox(
                width: fanWidth,
                height: phoneH + 12,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    for (var i = 0; i < shown.length; i++)
                      Transform.translate(
                        offset: Offset((i - mid) * spread, (i - mid).abs() * 1.4),
                        child: Transform.rotate(
                          angle: (i - mid) * 0.045,
                          child: Container(
                            width: phoneW,
                            height: phoneH,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x22080605),
                                  blurRadius: 10,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: CachedAssetImage(
                                shown[i],
                                height: phoneH,
                                filterQuality: FilterQuality.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(inset, 16, inset, compact ? 18 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Production apps',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                InkWell(
                  onTap: onViewWork,
                  child: Text(
                    'View work',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: context.colors.accent,
                      fontWeight: FontWeight.w600,
                    ),
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

class _NumbersCard extends StatefulWidget {
  const _NumbersCard();

  @override
  State<_NumbersCard> createState() => _NumbersCardState();
}

class _NumbersCardState extends State<_NumbersCard> {
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
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Glass(
      radius: 28,
      padding: _bentoPad(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardLabel('By the numbers'),
          const SizedBox(height: 18),
          for (var i = 0; i < _stats.length; i++) ...[
            Text(
              _stats[i].value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              _stats[i].label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 13,
              ),
            ),
            if (i != _stats.length - 1) const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}

class _MapCard extends StatelessWidget {
  const _MapCard();

  @override
  Widget build(BuildContext context) {
    final compact = context.isCompact;
    return Glass(
      radius: compact ? 24 : 28,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: compact ? 220 : _mapRowHeight,
        width: double.infinity,
        child: const MapCardFace(),
      ),
    );
  }
}

class _HowIWorkCard extends StatefulWidget {
  const _HowIWorkCard();

  @override
  State<_HowIWorkCard> createState() => _HowIWorkCardState();
}

class _HowIWorkCardState extends State<_HowIWorkCard> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final step = PortfolioData.workSteps[_index];
    final compact = context.isCompact;

    return Glass(
      radius: compact ? 24 : 28,
      padding: _bentoPad(context),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final fill = constraints.maxHeight.isFinite;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: fill ? MainAxisSize.max : MainAxisSize.min,
            children: [
              const CardLabel('How I work'),
              const SizedBox(height: 22),
              Text(
                step.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: compact ? 24 : 30,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                step.body,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.colors.muted,
                  fontSize: 15,
                ),
              ),
              if (fill) const Spacer() else SizedBox(height: compact ? 28 : 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var i = 0; i < PortfolioData.workSteps.length; i++)
                    _StepChip(
                      label: PortfolioData.workSteps[i].title,
                      selected: i == _index,
                      onTap: () => setState(() => _index = i),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StepChip extends StatelessWidget {
  const _StepChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: selected ? colors.ink : colors.bgElevated,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: selected ? colors.onInk : colors.text,
            ),
          ),
        ),
      ),
    );
  }
}
