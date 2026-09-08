import 'package:flutter/material.dart';

class CachedAssetImage extends StatelessWidget {
  const CachedAssetImage(
    this.asset, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.filterQuality = FilterQuality.low,
  });

  final String asset;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final FilterQuality filterQuality;

  static int decodePx(BuildContext context, double logical) {
    final dpr = MediaQuery.devicePixelRatioOf(context).clamp(1.0, 2.0);
    return (logical * dpr).round().clamp(1, 4096);
  }

  @override
  Widget build(BuildContext context) {
    // Only one cache dimension. Setting both forces a resize that
    // ignores the photo's real aspect ratio and stretches it.
    final int? cacheW;
    final int? cacheH;
    if (width != null && height != null) {
      if (width! >= height!) {
        cacheW = decodePx(context, width!);
        cacheH = null;
      } else {
        cacheW = null;
        cacheH = decodePx(context, height!);
      }
    } else if (width != null) {
      cacheW = decodePx(context, width!);
      cacheH = null;
    } else if (height != null) {
      cacheW = null;
      cacheH = decodePx(context, height!);
    } else {
      cacheW = null;
      cacheH = null;
    }

    return Image.asset(
      asset,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      filterQuality: filterQuality,
      gaplessPlayback: true,
      cacheWidth: cacheW,
      cacheHeight: cacheH,
      excludeFromSemantics: true,
    );
  }
}
