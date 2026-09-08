import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

bool allowWebBoot() {
  final win = web.window as JSObject;
  if (win.has('__eokBooted')) {
    web.window.location.reload();
    return false;
  }
  win['__eokBooted'] = true.toJS;
  return true;
}
