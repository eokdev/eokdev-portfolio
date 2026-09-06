import 'dart:js_interop';

@JS('location.reload')
external void _reload();

Future<void> reloadApp() async {
  _reload();
}
