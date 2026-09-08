import 'package:eokdev_portfolio/main.dart';
import 'package:eokdev_portfolio/utils/play_downloads.dart';
import 'package:eokdev_portfolio/widgets/cached_asset_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() {
    skipLiveDownloads = true;
    resetDownloadCache();
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    skipLiveDownloads = false;
  });

  Future<void> pumpPortfolio(WidgetTester tester, {Size size = const Size(1280, 900)}) async {
    await tester.binding.setSurfaceSize(size);
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  testWidgets('renders identity without farmers stat', (tester) async {
    await pumpPortfolio(tester);

    expect(find.textContaining('Emmanuel'), findsWidgets);
    expect(find.textContaining('Olorunshola'), findsWidgets);
    expect(find.text('Get in touch'), findsOneWidget);
    expect(find.text('App downloads'), findsOneWidget);
    expect(find.textContaining('Farmers'), findsNothing);
  });

  testWidgets('theme toggle switches the site to dark', (tester) async {
    await pumpPortfolio(tester);

    expect(find.byIcon(CupertinoIcons.moon), findsOneWidget);
    await tester.tap(find.byIcon(CupertinoIcons.moon));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byIcon(CupertinoIcons.sun_max), findsOneWidget);
    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, const Color(0xFF141312));
  });

  testWidgets('hamburger opens section menu', (tester) async {
    await pumpPortfolio(tester);

    await tester.tap(find.byIcon(CupertinoIcons.bars));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Work'), findsOneWidget);
    expect(find.text('Download resume'), findsOneWidget);
  });

  testWidgets('selected work lists production apps', (tester) async {
    await pumpPortfolio(tester, size: const Size(1280, 2200));

    expect(find.text('Apps in production.'), findsOneWidget);
    expect(find.text('Dream Planet'), findsOneWidget);
  });

  testWidgets('bento grid shows experience map and process', (tester) async {
    await pumpPortfolio(tester, size: const Size(1280, 1600));

    expect(find.text('MY EXPERIENCE'), findsOneWidget);
    expect(find.text('SELECTED APPS'), findsOneWidget);
    expect(find.text('BY THE NUMBERS'), findsOneWidget);
    expect(find.text('HOW I WORK'), findsOneWidget);
    expect(find.text('ABUJA'), findsOneWidget);
    expect(find.text('Open to work.'), findsOneWidget);
  });

  testWidgets('tablet width keeps bento cards readable', (tester) async {
    await pumpPortfolio(tester, size: const Size(820, 1180));

    expect(find.text('MY EXPERIENCE'), findsOneWidget);
    expect(find.text('SELECTED APPS'), findsOneWidget);
    expect(find.text('Get in touch'), findsOneWidget);
    expect(find.text('HOW I WORK'), findsOneWidget);
  });

  testWidgets('phone hero keeps the greeting and call button', (tester) async {
    await pumpPortfolio(tester, size: const Size(390, 844));

    expect(find.text('Get in touch'), findsOneWidget);
    expect(find.text('Open to work.'), findsOneWidget);
    expect(find.textContaining('Emmanuel'), findsWidgets);
  });

  testWidgets('about and contact stay reachable on a phone width', (tester) async {
    await pumpPortfolio(tester, size: const Size(390, 844));

    expect(
      find.textContaining('problem solver', skipOffstage: false),
      findsWidgets,
    );
    expect(
      find.text('Let us build the next one.', skipOffstage: false),
      findsOneWidget,
    );
    expect(find.text('Email me', skipOffstage: false), findsOneWidget);
  });

  testWidgets('cached images request a downscaled decode size', (tester) async {
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(size: Size(400, 800), devicePixelRatio: 2),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: CachedAssetImage(
            'assets/images/avatar.jpg',
            width: 34,
            height: 34,
          ),
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));
    expect(image.width, 34);
    expect(image.height, 34);
    expect(image.image, isA<ResizeImage>());
    final resized = image.image as ResizeImage;
    expect(resized.width, 68);
    expect(resized.height, isNull);
  });
}
