import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

const _key = 'eokdev-theme';

ThemeMode? readStoredThemeMode() {
  return switch (web.window.localStorage.getItem(_key)) {
    'dark' => ThemeMode.dark,
    'light' => ThemeMode.light,
    'system' => ThemeMode.system,
    _ => null,
  };
}

void persistThemeMode(ThemeMode mode) {
  web.window.localStorage.setItem(
    _key,
    switch (mode) {
      ThemeMode.dark => 'dark',
      ThemeMode.light => 'light',
      ThemeMode.system => 'system',
    },
  );
}

void syncWebChromeTheme({required bool dark}) {
  final root = web.document.documentElement;
  if (root == null) return;
  root.classList.toggle('dark', dark);

  final themeBtn = web.document.getElementById('web-nav-theme');
  themeBtn?.setAttribute(
    'aria-label',
    dark ? 'Use light mode' : 'Use dark mode',
  );

  final color = dark ? '#141312' : '#E7E7E8';
  final meta = web.document.querySelector('meta[name="theme-color"]');
  meta?.setAttribute('content', color);
}
