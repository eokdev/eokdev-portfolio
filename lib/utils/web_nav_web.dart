import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

const hasWebChromeNav = true;

JSObject get _win => web.window as JSObject;

void bindWebNav({
  required void Function() onMenu,
  required void Function() onHome,
  void Function()? onTheme,
}) {
  _bindClick('web-nav-menu', '__eokNavMenu', onMenu);
  _bindClick('web-nav-home', '__eokNavHome', onHome);
  if (onTheme != null) {
    _bindClick('web-nav-theme', '__eokNavTheme', onTheme);
  }
}

void _bindClick(String id, String key, void Function() onTap) {
  final el = web.document.getElementById(id);
  if (el == null) return;

  final prev = _win[key];
  if (prev.isA<JSFunction>()) {
    el.removeEventListener('click', prev as JSFunction);
  }

  final handler = ((web.Event event) {
    event.preventDefault();
    onTap();
  }).toJS;
  _win[key] = handler;
  el.addEventListener('click', handler);
}

void setWebNavOpen(bool open) {
  final menu = web.document.getElementById('web-nav-menu');
  if (menu != null) {
    menu.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
    menu.classList.toggle('is-open', open);
  }
}
