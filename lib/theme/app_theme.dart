import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final appTheme = buildAppTheme(AppColors.light);
final appDarkTheme = buildAppTheme(AppColors.dark);

ThemeData buildAppTheme(AppColors colors) {
  const family = 'Inter';
  final brightness =
      identical(colors, AppColors.dark) ? Brightness.dark : Brightness.light;
  final base = ThemeData(
    useMaterial3: true,
    brightness: brightness,
    fontFamily: family,
    scaffoldBackgroundColor: colors.bg,
    splashFactory: NoSplash.splashFactory,
    highlightColor: colors.highlight,
    dividerColor: colors.border,
    extensions: [colors],
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: brightness,
      primaryColor: colors.accent,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: colors.accent,
      brightness: brightness,
      surface: colors.bg,
      primary: colors.accent,
      onPrimary: Colors.white,
      secondary: colors.olive,
      onSurface: colors.text,
    ),
  );

  return base.copyWith(
    textTheme: base.textTheme.copyWith(
      displayLarge: base.textTheme.displayLarge?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.8,
        height: 1.02,
        color: colors.text,
      ),
      displayMedium: base.textTheme.displayMedium?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.4,
        height: 1.04,
        color: colors.text,
      ),
      displaySmall: base.textTheme.displaySmall?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.0,
        height: 1.08,
        color: colors.text,
      ),
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.6,
        color: colors.text,
      ),
      headlineSmall: base.textTheme.headlineSmall?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w700,
        color: colors.text,
      ),
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
        color: colors.text,
      ),
      titleMedium: base.textTheme.titleMedium?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
        color: colors.text,
      ),
      bodyLarge: base.textTheme.bodyLarge?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        height: 1.6,
        fontSize: 16,
        color: colors.text,
      ),
      bodyMedium: base.textTheme.bodyMedium?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        height: 1.55,
        color: colors.muted,
      ),
      labelLarge: base.textTheme.labelLarge?.copyWith(
        fontFamily: family,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
        color: colors.text,
      ),
    ),
  );
}
