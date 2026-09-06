import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('index.html declares browser security policies', () {
    final html = File('web/index.html').readAsStringSync();
    expect(html, contains('Content-Security-Policy'));
    expect(html, contains("default-src 'self'"));
    expect(html, contains('X-Content-Type-Options'));
    expect(html, contains('nosniff'));
    expect(html, contains('name="referrer"'));
    expect(html, contains('strict-origin-when-cross-origin'));
    expect(html, contains('Permissions-Policy'));
    expect(html, contains("frame-src 'none'"));
    expect(html, contains("object-src 'none'"));
    expect(html, contains('https://www.gstatic.com'));
    expect(html, contains('viewport-fit=cover'));
    expect(html, contains('id="app-loader"'));
    expect(html, contains('id="flutter-host"'));
    expect(html, isNot(contains('http://example')));
  });

  test('host headers cover scanner checks', () {
    final headers = File('web/_headers').readAsStringSync();
    for (final name in [
      'Content-Security-Policy',
      'X-Content-Type-Options',
      'X-Frame-Options',
      'Referrer-Policy',
      'Permissions-Policy',
      'Strict-Transport-Security',
      'Cross-Origin-Opener-Policy',
      'Cross-Origin-Resource-Policy',
    ]) {
      expect(headers, contains(name), reason: 'missing $name');
    }
    expect(headers, contains('X-Frame-Options: DENY'));
    expect(headers, contains('max-age=31536000'));
  });
}
