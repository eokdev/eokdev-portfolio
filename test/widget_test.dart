import 'package:eokdev_portfolio/main.dart';
import 'package:eokdev_portfolio/utils/play_downloads.dart';
import 'package:eokdev_portfolio/widgets/cached_asset_image.dart';
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
    expect(find.text('See selected work'), findsOneWidget);
    expect(find.text('App downloads'), findsOneWidget);
    expect(find.textContaining('Farmers'), findsNothing);
  });

  testWidgets('selected work lists production apps', (tester) async {
    await pumpPortfolio(tester);

    expect(find.text('Apps in production.', skipOffstage: false), findsOneWidget);
    expect(find.text('Dream Planet', skipOffstage: false), findsOneWidget);
    expect(find.text('Autovendy', skipOffstage: false), findsOneWidget);
    expect(find.text('TradeVila', skipOffstage: false), findsOneWidget);
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
