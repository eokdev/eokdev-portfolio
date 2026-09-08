import 'package:flutter/material.dart';

abstract final class Breakpoints {
  static const compact = 700.0;
  static const medium = 1080.0;
}

enum SiteSize { compact, medium, expanded }

SiteSize siteSizeOf(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < Breakpoints.compact) return SiteSize.compact;
  if (width < Breakpoints.medium) return SiteSize.medium;
  return SiteSize.expanded;
}

double sitePaddingOf(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 400) return 16;
  if (width < Breakpoints.compact) return 20;
  if (width < Breakpoints.medium) return 32;
  if (width < 1400) return 56;
  return 80;
}

double siteMaxWidthOf(BuildContext context) {
  return switch (siteSizeOf(context)) {
    SiteSize.compact => 720,
    SiteSize.medium => 980,
    SiteSize.expanded => 1180,
  };
}

extension SiteSizeX on BuildContext {
  SiteSize get siteSize => siteSizeOf(this);
  bool get isCompact => siteSize == SiteSize.compact;
  bool get isMedium => siteSize == SiteSize.medium;
  bool get isExpanded => siteSize == SiteSize.expanded;
  double get sitePad => sitePaddingOf(this);
  double get siteMax => siteMaxWidthOf(this);
}
