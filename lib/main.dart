import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'pages/home_page.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';
import 'utils/theme_pref.dart';
import 'utils/web_boot.dart';

void main() {
  if (!allowWebBoot()) return;
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache
    ..maximumSize = 64
    ..maximumSizeBytes = 32 << 20;
  VisibilityDetectorController.instance.updateInterval =
      const Duration(milliseconds: 200);
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> with WidgetsBindingObserver {
  late final ThemeController _theme;

  @override
  void initState() {
    super.initState();
    _theme = ThemeController();
    _theme.addListener(_onThemeChanged);
    WidgetsBinding.instance.addObserver(this);
    _syncChrome();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _theme
      ..removeListener(_onThemeChanged)
      ..dispose();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _syncChrome();
  }

  void _onThemeChanged() {
    if (!mounted) return;
    setState(_syncChrome);
  }

  void _syncChrome() {
    final platformDark =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    final dark = switch (_theme.mode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system => platformDark,
    };
    syncWebChromeTheme(dark: dark);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeControllerScope(
      controller: _theme,
      child: ListenableBuilder(
        listenable: _theme,
        builder: (context, _) {
          return MaterialApp(
            title: 'Emmanuel Olorunshola · Flutter Engineer',
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            darkTheme: appDarkTheme,
            themeMode: _theme.mode,
            builder: (context, child) {
              final media = MediaQuery.of(context);
              return MediaQuery(
                data: media.copyWith(
                  textScaler: media.textScaler.clamp(
                    minScaleFactor: 0.9,
                    maxScaleFactor: 1.2,
                  ),
                ),
                child: child ?? const SizedBox.shrink(),
              );
            },
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
