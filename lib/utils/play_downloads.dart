import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../data/portfolio_data.dart';

/// Last known Play Store lower bounds, used if a live fetch misses an app.
/// App Store does not publish download counts.
const fallbackDownloadsById = <String, int>{
  'com.dreamplanet.app': 500,
  'com.tractrac.plus': 1000,
  'com.tractrac.agent': 1000,
  'com.nexodius.nexodius': 5,
  'com.autovendy.app': 100,
  'com.medik.apppublic': 50,
  'com.ikore.path': 5,
  'com.tractrac.tea': 100,
  'com.app.blinkers': 100000,
  'com.trade.vila': 1,
  'com.service.rendering': 10,
};

/// Set in tests so the hero never opens 11 network connections.
bool skipLiveDownloads = false;

int? _cachedTotal;

final _labelPattern = RegExp(
  r'(\d[\d,]*(?:\.\d+)?[KMB]?\+)\s+Downloads',
  caseSensitive: false,
);
final _htmlPattern = RegExp(
  r'class="ClM7O">([^<]+)</div><div class="g1rdde">Downloads</div>',
);

final playPackageIdPattern = RegExp(
  r'^[a-zA-Z][a-zA-Z0-9_]*(\.[a-zA-Z][a-zA-Z0-9_]*)+$',
);

bool isValidPlayPackageId(String id) => playPackageIdPattern.hasMatch(id);

int? parseDownloadLabel(String label) {
  final cleaned = label.toUpperCase().replaceAll(',', '').trim();
  final match = RegExp(r'(\d+(?:\.\d+)?)([KMB])?\+?').firstMatch(cleaned);
  if (match == null) return null;
  final amount = double.parse(match.group(1)!);
  final suffix = match.group(2);
  final multiplier = switch (suffix) {
    'K' => 1000,
    'M' => 1000000,
    'B' => 1000000000,
    _ => 1,
  };
  return (amount * multiplier).round();
}

int? parseDownloadsFromPage(String body) {
  final html = _htmlPattern.firstMatch(body);
  if (html != null) return parseDownloadLabel(html.group(1)!);
  final label = _labelPattern.firstMatch(body);
  if (label != null) return parseDownloadLabel(label.group(1)!);
  return null;
}

String formatDownloadTotal(int total) {
  if (total >= 1000000000) return '${total ~/ 1000000000}B+';
  if (total >= 1000000) return '${total ~/ 1000000}M+';
  if (total >= 1000) return '${total ~/ 1000}K+';
  return '$total+';
}

int fallbackDownloadTotal() {
  return fallbackDownloadsById.values.fold<int>(0, (sum, value) => sum + value);
}

Future<int?> _fetchOne(String packageId) async {
  if (!isValidPlayPackageId(packageId)) return null;
  final uri = Uri.parse(
    'https://r.jina.ai/https://play.google.com/store/apps/details?id=$packageId',
  );
  try {
    final response = await http.get(uri).timeout(const Duration(seconds: 12));
    if (response.statusCode != 200) return null;
    return parseDownloadsFromPage(response.body);
  } catch (_) {
    return null;
  }
}

Future<List<int?>> _fetchLimited(List<String> ids, {int limit = 3}) async {
  final results = List<int?>.filled(ids.length, null);
  var cursor = 0;
  Future<void> worker() async {
    while (cursor < ids.length) {
      final index = cursor++;
      results[index] = await _fetchOne(ids[index]);
    }
  }

  await Future.wait([for (var i = 0; i < limit && i < ids.length; i++) worker()]);
  return results;
}

/// Sums public Play Store download floors for apps listed on the portfolio.
Future<int> fetchPortfolioDownloads() async {
  if (skipLiveDownloads) return _cachedTotal ?? fallbackDownloadTotal();
  if (_cachedTotal != null) return _cachedTotal!;

  final counts = Map<String, int>.from(fallbackDownloadsById);
  final ids = PortfolioData.playPackageIds;
  final results = await _fetchLimited(ids);
  for (var i = 0; i < ids.length; i++) {
    final live = results[i];
    if (live != null && live > 0) counts[ids[i]] = live;
  }
  final total = counts.values.fold<int>(0, (sum, value) => sum + value);
  _cachedTotal = total;
  return total;
}

@visibleForTesting
void resetDownloadCache() {
  _cachedTotal = null;
}
