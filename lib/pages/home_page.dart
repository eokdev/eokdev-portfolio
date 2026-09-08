import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/hero_section.dart';
import '../sections/site_footer.dart';
import '../sections/skills_section.dart';
import '../sections/work_section.dart';
import '../theme/app_colors.dart';
import '../theme/layout.dart';
import '../theme/theme_controller.dart';
import '../utils/reload_app.dart';
import '../utils/web_nav.dart';
import '../widgets/site_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  final _keys = <String, GlobalKey>{
    'hero': GlobalKey(),
    'work': GlobalKey(),
    'experience': GlobalKey(),
    'skills': GlobalKey(),
    'about': GlobalKey(),
    'contact': GlobalKey(),
  };

  final _elevated = ValueNotifier(false);
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    bindWebNav(
      onMenu: () {
        final next = !_menuOpen;
        setState(() => _menuOpen = next);
        setWebNavOpen(next);
      },
      onHome: () => _goTo('hero'),
      onTheme: () => ThemeControllerScope.of(context).toggle(context),
    );
  }

  @override
  void dispose() {
    _scroll
      ..removeListener(_onScroll)
      ..dispose();
    _elevated.dispose();
    super.dispose();
  }

  void _onScroll() {
    final next = _scroll.offset > 12;
    if (next != _elevated.value) _elevated.value = next;
  }

  Future<void> _goTo(String id) async {
    setState(() => _menuOpen = false);
    setWebNavOpen(false);
    await Future<void>.delayed(Duration.zero);
    if (!mounted) return;
    if (id == 'hero') {
      await _scroll.animateTo(
        0,
        duration: const Duration(milliseconds: 720),
        curve: Curves.easeInOutCubic,
      );
      return;
    }
    final target = _keys[id]?.currentContext;
    if (target == null || !target.mounted) return;
    await Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 720),
      curve: Curves.easeInOutCubic,
      alignment: 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.bg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (hasWebChromeNav)
            const SizedBox(height: 70)
          else
            ValueListenableBuilder<bool>(
              valueListenable: _elevated,
              builder: (context, elevated, _) {
                return SiteNav(
                  elevated: elevated,
                  menuOpen: _menuOpen,
                  onToggleMenu: () => setState(() => _menuOpen = !_menuOpen),
                  onNavigate: _goTo,
                );
              },
            ),
          Expanded(
            child: Stack(
              children: [
                ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: !context.isCompact,
                  ),
                  child: RefreshIndicator(
                    color: colors.accent,
                    backgroundColor: colors.card,
                    displacement: 48,
                    onRefresh: reloadApp,
                    child: CustomScrollView(
                      controller: _scroll,
                      cacheExtent: 240,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                        slivers: [
                        SliverToBoxAdapter(
                          child: HeroSection(
                            idKey: _keys['hero']!,
                            onViewWork: () => _goTo('work'),
                            onContact: () => _goTo('contact'),
                          ),
                        ),
                        ...WorkSection.slivers(idKey: _keys['work']!),
                        SliverToBoxAdapter(
                          child: ExperienceSection(idKey: _keys['experience']!),
                        ),
                        SliverToBoxAdapter(
                          child: SkillsSection(idKey: _keys['skills']!),
                        ),
                        SliverToBoxAdapter(
                          child: AboutSection(idKey: _keys['about']!),
                        ),
                        SliverToBoxAdapter(
                          child: ContactSection(idKey: _keys['contact']!),
                        ),
                        const SliverToBoxAdapter(child: SiteFooter()),
                      ],
                    ),
                  ),
                ),
                if (_menuOpen)
                  Positioned.fill(
                    child: MobileMenu(onNavigate: _goTo),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
