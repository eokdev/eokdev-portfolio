import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Reveal extends StatefulWidget {
  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.immediate = false,
  });

  final Widget child;
  final Duration delay;
  final bool immediate;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> {
  late bool _shown = widget.immediate;
  Timer? _pending;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _shown) return;
      _reveal();
    });
  }

  @override
  void dispose() {
    _pending?.cancel();
    super.dispose();
  }

  void _reveal() {
    if (_shown) return;
    _pending?.cancel();
    if (widget.delay == Duration.zero) {
      setState(() => _shown = true);
      return;
    }
    _pending = Timer(widget.delay, () {
      if (mounted) setState(() => _shown = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('reveal-${identityHashCode(this)}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= 0.08) _reveal();
      },
      child: AnimatedOpacity(
        opacity: _shown ? 1 : 0,
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeOutCubic,
        child: AnimatedSlide(
          offset: _shown ? Offset.zero : const Offset(0, 0.06),
          duration: const Duration(milliseconds: 420),
          curve: Curves.easeOutCubic,
          child: widget.child,
        ),
      ),
    );
  }
}
