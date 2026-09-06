import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/hero_section.dart';
import '../sections/site_footer.dart';
import '../sections/skills_section.dart';
import '../sections/work_section.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: RepaintBoundary(child: _Backdrop()),
          ),
          Column(
            children: [
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
                    CustomScrollView(
                      controller: _scroll,
                      slivers: [
                        SliverToBoxAdapter(
                          child: HeroSection(
                            idKey: _keys['hero']!,
                            onViewWork: () => _goTo('work'),
                            onContact: () => _goTo('contact'),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: WorkSection(idKey: _keys['work']!),
                        ),
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
                    if (_menuOpen)
                      Positioned.fill(
                        child: MobileMenu(onNavigate: _goTo),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Backdrop extends StatelessWidget {
  const _Backdrop();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B0A0C), Color(0xFF1A1410), Color(0xFF120E14)],
        ),
      ),
      child: Stack(
        children: [
          _Glow(alignment: Alignment(-1.05, -1.0), color: Color(0x66C9A25A), size: 460),
          _Glow(alignment: Alignment(1.1, -0.15), color: Color(0x449C3B2F), size: 400),
          _Glow(alignment: Alignment(-0.15, 1.05), color: Color(0x338B6914), size: 360),
          _Glow(alignment: Alignment(0.85, 0.9), color: Color(0x33E4C989), size: 300),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({
    required this.alignment,
    required this.color,
    required this.size,
  });

  final Alignment alignment;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [color, color.withValues(alpha: 0)],
            ),
          ),
        ),
      ),
    );
  }
}
