import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../utils/launchers.dart';
import 'cached_asset_image.dart';
import 'glass.dart';
import 'section_shell.dart';

class NavItem {
  const NavItem(this.label, this.section);

  final String label;
  final String section;
}

const navItems = [
  NavItem('Work', 'work'),
  NavItem('Experience', 'experience'),
  NavItem('Skills', 'skills'),
  NavItem('About', 'about'),
  NavItem('Contact', 'contact'),
];

class SiteNav extends StatelessWidget {
  const SiteNav({
    super.key,
    required this.elevated,
    required this.onNavigate,
    required this.menuOpen,
    required this.onToggleMenu,
  });

  final bool elevated;
  final ValueChanged<String> onNavigate;
  final bool menuOpen;
  final VoidCallback onToggleMenu;

  @override
  Widget build(BuildContext context) {
    final compact = context.isCompact;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(context.sitePad, 10, context.sitePad, 8),
        child: Glass(
          radius: 22,
          frosted: true,
          blur: elevated || menuOpen ? 28 : 18,
          tint: elevated || menuOpen ? AppColors.glassHeavy : AppColors.glass,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                _Logo(onTap: () => onNavigate('hero')),
                const Spacer(),
                if (!compact)
                  Row(
                    children: [
                      for (final item in navItems)
                        _NavLink(
                          label: item.label,
                          onTap: () => onNavigate(item.section),
                        ),
                      const SizedBox(width: 8),
                      IosButton(
                        label: 'Resume',
                        onPressed: openResume,
                      ),
                    ],
                  )
                else
                  IconButton(
                    onPressed: onToggleMenu,
                    tooltip: '',
                    icon: Icon(
                      menuOpen ? CupertinoIcons.xmark : CupertinoIcons.bars,
                      color: AppColors.text,
                      size: 22,
                      semanticLabel: menuOpen ? 'Close menu' : 'Open menu',
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

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key, required this.onNavigate});

  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 36, sigmaY: 36),
        child: ColoredBox(
          color: const Color(0xCC07101C),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 72),
                  for (final item in navItems)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: TextButton(
                        onPressed: () => onNavigate(item.section),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          item.label,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 34,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  IosButton(label: 'Download resume', onPressed: openResume),
                  const Spacer(),
                  Text(
                    PortfolioData.profile.email,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: const CachedAssetImage(
              'assets/images/hero.jpg',
              width: 34,
              height: 34,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'eokdev',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.muted,
          ),
        ),
      ),
    );
  }
}
