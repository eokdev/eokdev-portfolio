import 'package:flutter/material.dart';

import '../utils/theme_pref.dart';

class ThemeController extends ChangeNotifier {
  ThemeController() : _mode = readStoredThemeMode() ?? ThemeMode.dark;

  ThemeMode _mode;
  ThemeMode get mode => _mode;

  bool isDark(BuildContext context) {
    return switch (_mode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system =>
        MediaQuery.platformBrightnessOf(context) == Brightness.dark,
    };
  }

  void toggle(BuildContext context) {
    setMode(isDark(context) ? ThemeMode.light : ThemeMode.dark);
  }

  void setMode(ThemeMode mode) {
    if (_mode == mode) return;
    _mode = mode;
    persistThemeMode(mode);
    notifyListeners();
  }
}

class ThemeControllerScope extends InheritedNotifier<ThemeController> {
  const ThemeControllerScope({
    super.key,
    required ThemeController controller,
    required super.child,
  }) : super(notifier: controller);

  static ThemeController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ThemeControllerScope>();
    assert(scope != null, 'ThemeControllerScope not found');
    return scope!.notifier!;
  }
}
