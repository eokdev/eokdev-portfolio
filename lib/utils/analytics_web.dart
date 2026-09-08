import 'dart:js_interop';

@JS('triangle.event')
external void _triangleEvent(String name, [JSAny? props]);

void trackEvent(String name, [Map<String, Object?>? props]) {
  if (name.isEmpty) return;
  try {
    _triangleEvent(name, props?.jsify());
  } catch (_) {}
}
