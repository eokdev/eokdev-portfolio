import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData buildAppTheme() {
  final display = GoogleFonts.cormorantGaramondTextTheme();
  final body = GoogleFonts.outfitTextTheme();

  final textTheme = body.copyWith(
    displayLarge: display.displayLarge?.copyWith(
      fontWeight: FontWeight.w600,
      letterSpacing: -1.6,
      height: 0.92,
      color: AppColors.text,
    ),
    displayMedium: display.displayMedium?.copyWith(
      fontWeight: FontWeight.w600,
      letterSpacing: -1.2,
      height: 0.96,
      color: AppColors.text,
    ),
    displaySmall: display.displaySmall?.copyWith(
      fontWeight: FontWeight.w600,
      letterSpacing: -0.6,
      height: 1.06,
      color: AppColors.text,
    ),
    headlineMedium: display.headlineMedium?.copyWith(
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3,
      color: AppColors.text,
    ),
    headlineSmall: display.headlineSmall?.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    ),
    titleLarge: display.titleLarge?.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    ),
    titleMedium: body.titleMedium?.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: AppColors.text,
    ),
    bodyLarge: body.bodyLarge?.copyWith(
      height: 1.65,
      fontSize: 17,
      color: AppColors.text,
    ),
    bodyMedium: body.bodyMedium?.copyWith(
      height: 1.6,
      color: AppColors.muted,
    ),
    labelLarge: body.labelLarge?.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.4,
      color: AppColors.text,
    ),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bg,
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.accent,
    ),
    colorScheme: const ColorScheme.dark(
      surface: AppColors.bg,
      primary: AppColors.accent,
      onPrimary: AppColors.ink,
      secondary: AppColors.accentSoft,
      onSurface: AppColors.text,
    ),
    textTheme: textTheme,
    splashFactory: NoSplash.splashFactory,
    highlightColor: const Color(0x14E4C989),
  );
}
