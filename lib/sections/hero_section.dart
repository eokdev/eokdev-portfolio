import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../utils/launchers.dart';
import '../widgets/cached_asset_image.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';
import 'bento_section.dart';

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
    final width = MediaQuery.sizeOf(context).width;
    final nameSize = switch (context.siteSize) {
      SiteSize.compact => width < 380 ? 28.0 : 34.0,
      SiteSize.medium => 46.0,
      SiteSize.expanded => 62.0,
    };
    final lineSize = compact ? (width < 380 ? 22.0 : 26.0) : (context.isMedium ? 32.0 : 40.0);
    final profile = PortfolioData.profile;
    final avatarSize = compact ? 36.0 : 52.0;

    return SectionShell(
      idKey: idKey,
      top: compact ? 20 : 36,
      bottom: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Reveal(
            immediate: true,
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Hi, I'm ",
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: nameSize,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ClipOval(
                              child: CachedAssetImage(
                                'assets/images/avatar.jpg',
                                width: avatarSize,
                                height: avatarSize,
                                alignment: const Alignment(-0.2, -0.12),
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' ${profile.fullName}!',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: nameSize,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 10),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "I'm a ",
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontSize: lineSize,
                                fontWeight: FontWeight.w500,
                                color: context.colors.muted,
                              ),
                            ),
                            TextSpan(
                              text: 'Flutter Engineer',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontSize: lineSize,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' in',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontSize: lineSize,
                                fontWeight: FontWeight.w500,
                                color: context.colors.muted,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Abuja, Nigeria.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: lineSize,
                          fontWeight: FontWeight.w700,
                          color: context.colors.accent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const _OpenBadge(),
                const SizedBox(height: 28),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 22,
                  runSpacing: 16,
                  children: [
                    _GetInTouchButton(
                      onPressed: () {
                        onContact();
                        openMail(profile.email, subject: 'Get in touch');
                      },
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 280),
                      child: Text(
                        'Feel free to explore the work and reach out. I would love to connect!',
                        textAlign: compact ? TextAlign.center : TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: compact ? 36 : 48),
          BentoSection(onViewWork: onViewWork),
        ],
      ),
    );
  }
}

class _GetInTouchButton extends StatefulWidget {
  const _GetInTouchButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_GetInTouchButton> createState() => _GetInTouchButtonState();
}

class _GetInTouchButtonState extends State<_GetInTouchButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _hover ? 1.04 : 1,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.fromLTRB(26, 15, 22, 15),
            decoration: BoxDecoration(
              color: _hover ? colors.accent : colors.ink,
              borderRadius: BorderRadius.circular(999),
              boxShadow: _hover
                  ? [
                      BoxShadow(
                        color: colors.accent.withValues(alpha: 0.28),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : const [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Get in touch',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: _hover ? Colors.white : colors.onInk,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.1,
                    height: 1,
                  ),
                ),
                const SizedBox(width: 10),
                AnimatedSlide(
                  offset: _hover ? const Offset(0.12, -0.12) : Offset.zero,
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  child: Icon(
                    CupertinoIcons.arrow_up_right,
                    size: 14,
                    color: _hover ? Colors.white : colors.onInk,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OpenBadge extends StatelessWidget {
  const _OpenBadge();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: colors.sage,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: colors.live,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Open to work.',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: colors.text,
            ),
          ),
        ],
      ),
    );
  }
}
