import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../theme/theme_controller.dart';
import '../utils/launchers.dart';
import 'cached_asset_image.dart';
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
    final colors = context.colors;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.bg.withValues(alpha: elevated || menuOpen ? 0.96 : 1),
        border: Border(
          bottom: BorderSide(
            color: elevated ? colors.border : Colors.transparent,
          ),
        ),
      ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(context.sitePad, 10, context.sitePad, 10),
          child: Row(
          children: [
            InkWell(
              onTap: () => onNavigate('hero'),
              borderRadius: BorderRadius.circular(20),
              child: const ClipOval(
                child: CachedAssetImage(
                  'assets/images/hero.jpg',
                  width: 36,
                  height: 36,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: InkWell(
                onTap: () => openMail(PortfolioData.profile.email),
                borderRadius: BorderRadius.circular(8),
                child: Text(
                  PortfolioData.profile.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const _ThemeButton(),
            const SizedBox(width: 8),
            _MenuButton(open: menuOpen, onTap: onToggleMenu),
          ],
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
    return ColoredBox(
      color: context.colors.bg,
      child: SafeArea(
        left: false,
        right: false,
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(context.sitePad, 12, context.sitePad, 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              for (final item in navItems)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: TextButton(
                    onPressed: () => onNavigate(item.section),
                    style: TextButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      item.label,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 40,
                        letterSpacing: -1.2,
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
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: colors.bgElevated,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => ThemeControllerScope.of(context).toggle(context),
        child: SizedBox.square(
          dimension: 46,
          child: Icon(
            dark ? CupertinoIcons.sun_max : CupertinoIcons.moon,
            size: 18,
            color: colors.ink,
            semanticLabel: dark ? 'Use light mode' : 'Use dark mode',
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.open, required this.onTap});

  final bool open;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: colors.bgElevated,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox.square(
          dimension: 46,
          child: Icon(
            open ? CupertinoIcons.xmark : CupertinoIcons.bars,
            size: 20,
            color: colors.ink,
            semanticLabel: open ? 'Close menu' : 'Open menu',
          ),
        ),
      ),
    );
  }
}
