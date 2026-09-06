import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'pages/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  VisibilityDetectorController.instance.updateInterval =
      const Duration(milliseconds: 200);
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emmanuel Olorunshola · Flutter Engineer',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomePage(),
    );
  }
}
