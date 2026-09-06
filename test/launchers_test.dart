import 'package:eokdev_portfolio/utils/launchers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('https store and profile links are allowed', () {
    expect(isSafeWebUrl('https://github.com/eokdev'), isTrue);
    expect(
      isSafeWebUrl('https://play.google.com/store/apps/details?id=com.autovendy.app'),
      isTrue,
    );
    expect(
      isSafeWebUrl('https://apps.apple.com/us/app/blinkers/id6473721412'),
      isTrue,
    );
  });

  test('unsafe schemes and traversal are blocked', () {
    expect(isSafeWebUrl('http://example.com'), isFalse);
    expect(isSafeWebUrl('javascript:alert(1)'), isFalse);
    expect(isSafeWebUrl('data:text/html,hi'), isFalse);
    expect(isSafeWebUrl('file:///etc/passwd'), isFalse);
    expect(isSafeWebUrl('assets/../secret.pdf'), isFalse);
  });

  test('same-origin resume path is allowed', () {
    expect(isSafeWebUrl('assets/assets/docs/emmanuel_resume.pdf'), isTrue);
  });

  test('email and phone hrefs stay strict', () {
    expect(isSafeEmail('eokdeveloper@gmail.com'), isTrue);
    expect(isSafeEmail('not-an-email'), isFalse);
    expect(isSafeEmail('a@b@c.com'), isFalse);
    expect(safeTelHref('+234 706 082 3080'), 'tel:+2347060823080');
    expect(safeTelHref('javascript:alert(1)'), isNull);
    expect(safeTelHref('123'), isNull);
  });
}
