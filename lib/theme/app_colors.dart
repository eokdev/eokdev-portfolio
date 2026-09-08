import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.bg,
    required this.bgElevated,
    required this.card,
    required this.surface,
    required this.surfaceHigh,
    required this.border,
    required this.text,
    required this.muted,
    required this.accent,
    required this.accentSoft,
    required this.accentDim,
    required this.ink,
    required this.onInk,
    required this.glass,
    required this.glassHeavy,
    required this.highlight,
    required this.sage,
    required this.live,
    required this.olive,
    required this.rust,
    required this.shadow,
  });

  final Color bg;
  final Color bgElevated;
  final Color card;
  final Color surface;
  final Color surfaceHigh;
  final Color border;
  final Color text;
  final Color muted;
  final Color accent;
  final Color accentSoft;
  final Color accentDim;
  final Color ink;
  final Color onInk;
  final Color glass;
  final Color glassHeavy;
  final Color highlight;
  final Color sage;
  final Color live;
  final Color olive;
  final Color rust;
  final Color shadow;

  static const brand = Color(0xFFE92604);

  static const light = AppColors(
    bg: Color(0xFFE7E7E8),
    bgElevated: Color(0xFFF4F4F2),
    card: Color(0xFFF7F7F5),
    surface: Color(0xFFF3F3F0),
    surfaceHigh: Color(0xFFFFFFFF),
    border: Color(0xFFD5D6D1),
    text: Color(0xFF080605),
    muted: Color(0xFF748079),
    accent: brand,
    accentSoft: Color(0xFFAC461A),
    accentDim: Color(0x1AE92604),
    ink: Color(0xFF080605),
    onInk: Color(0xFFFFFFFF),
    glass: Color(0xFFF7F7F5),
    glassHeavy: Color(0xFFFFFFFF),
    highlight: Color(0x14E92604),
    sage: Color(0xFFE4E8E3),
    live: Color(0xFF2F8F4E),
    olive: Color(0xFF748079),
    rust: Color(0xFF5A4F4E),
    shadow: Color(0x14080605),
  );

  static const dark = AppColors(
    bg: Color(0xFF141312),
    bgElevated: Color(0xFF1C1B19),
    card: Color(0xFF1F1E1C),
    surface: Color(0xFF1A1917),
    surfaceHigh: Color(0xFF262522),
    border: Color(0xFF33322E),
    text: Color(0xFFF3F1EE),
    muted: Color(0xFF9C9D98),
    accent: brand,
    accentSoft: Color(0xFFF04A2A),
    accentDim: Color(0x33E92604),
    ink: Color(0xFFF3F1EE),
    onInk: Color(0xFF080605),
    glass: Color(0xFF1F1E1C),
    glassHeavy: Color(0xFF262522),
    highlight: Color(0x24E92604),
    sage: Color(0xFF243028),
    live: Color(0xFF3DAF64),
    olive: Color(0xFF9C9D98),
    rust: Color(0xFFC8BDB8),
    shadow: Color(0x66000000),
  );

  static AppColors of(BuildContext context) {
    return Theme.of(context).extension<AppColors>() ?? light;
  }

  @override
  AppColors copyWith({
    Color? bg,
    Color? bgElevated,
    Color? card,
    Color? surface,
    Color? surfaceHigh,
    Color? border,
    Color? text,
    Color? muted,
    Color? accent,
    Color? accentSoft,
    Color? accentDim,
    Color? ink,
    Color? onInk,
    Color? glass,
    Color? glassHeavy,
    Color? highlight,
    Color? sage,
    Color? live,
    Color? olive,
    Color? rust,
    Color? shadow,
  }) {
    return AppColors(
      bg: bg ?? this.bg,
      bgElevated: bgElevated ?? this.bgElevated,
      card: card ?? this.card,
      surface: surface ?? this.surface,
      surfaceHigh: surfaceHigh ?? this.surfaceHigh,
      border: border ?? this.border,
      text: text ?? this.text,
      muted: muted ?? this.muted,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      accentDim: accentDim ?? this.accentDim,
      ink: ink ?? this.ink,
      onInk: onInk ?? this.onInk,
      glass: glass ?? this.glass,
      glassHeavy: glassHeavy ?? this.glassHeavy,
      highlight: highlight ?? this.highlight,
      sage: sage ?? this.sage,
      live: live ?? this.live,
      olive: olive ?? this.olive,
      rust: rust ?? this.rust,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      bg: Color.lerp(bg, other.bg, t)!,
      bgElevated: Color.lerp(bgElevated, other.bgElevated, t)!,
      card: Color.lerp(card, other.card, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceHigh: Color.lerp(surfaceHigh, other.surfaceHigh, t)!,
      border: Color.lerp(border, other.border, t)!,
      text: Color.lerp(text, other.text, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      accentDim: Color.lerp(accentDim, other.accentDim, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      onInk: Color.lerp(onInk, other.onInk, t)!,
      glass: Color.lerp(glass, other.glass, t)!,
      glassHeavy: Color.lerp(glassHeavy, other.glassHeavy, t)!,
      highlight: Color.lerp(highlight, other.highlight, t)!,
      sage: Color.lerp(sage, other.sage, t)!,
      live: Color.lerp(live, other.live, t)!,
      olive: Color.lerp(olive, other.olive, t)!,
      rust: Color.lerp(rust, other.rust, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}

extension AppColorsX on BuildContext {
  AppColors get colors => AppColors.of(this);
}
