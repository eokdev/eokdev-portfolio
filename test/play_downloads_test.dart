import 'package:eokdev_portfolio/utils/play_downloads.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(resetDownloadCache);

  test('parseDownloadLabel reads Play Store ranges', () {
    expect(parseDownloadLabel('1K+'), 1000);
    expect(parseDownloadLabel('100K+'), 100000);
    expect(parseDownloadLabel('500+'), 500);
    expect(parseDownloadLabel('1,000+'), 1000);
    expect(parseDownloadLabel('not a count'), isNull);
  });

  test('parseDownloadsFromPage reads store HTML and Jina text', () {
    expect(
      parseDownloadsFromPage(
        '<div class="ClM7O">1K+</div><div class="g1rdde">Downloads</div>',
      ),
      1000,
    );
    expect(parseDownloadsFromPage('Everyone  100K+  Downloads  Install'), 100000);
    expect(parseDownloadsFromPage('no counts here'), isNull);
  });

  test('formatDownloadTotal stays compact', () {
    expect(formatDownloadTotal(102771), '102K+');
    expect(formatDownloadTotal(500), '500+');
    expect(formatDownloadTotal(2500000), '2M+');
  });

  test('fallback total matches known Play Store floors', () {
    expect(fallbackDownloadTotal(), 102771);
    expect(formatDownloadTotal(fallbackDownloadTotal()), '102K+');
  });

  test('Play package ids reject injection', () {
    expect(isValidPlayPackageId('com.dreamplanet.app'), isTrue);
    expect(isValidPlayPackageId('com.app.blinkers'), isTrue);
    expect(isValidPlayPackageId('https://evil.example'), isFalse);
    expect(isValidPlayPackageId('../etc/passwd'), isFalse);
    expect(isValidPlayPackageId('com.foo/bar'), isFalse);
    expect(isValidPlayPackageId(''), isFalse);
  });

  test('skipLiveDownloads never opens the network', () async {
    skipLiveDownloads = true;
    addTearDown(() => skipLiveDownloads = false);
    expect(await fetchPortfolioDownloads(), fallbackDownloadTotal());
  });
}
