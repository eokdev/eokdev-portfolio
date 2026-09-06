import 'dart:js_interop';

import 'package:web/web.dart' as web;

void bindViewportMetrics(void Function() onChange) {
  final viewport = web.window.visualViewport;
  if (viewport == null) return;
  void handle(web.Event _) => onChange();
  viewport.addEventListener('resize', handle.toJS);
  viewport.addEventListener('scroll', handle.toJS);
}
