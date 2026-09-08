import 'package:url_launcher/url_launcher.dart';

import 'analytics.dart';

final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

bool isSafeWebUrl(String url) {
  if (url.contains('..')) return false;
  final uri = Uri.tryParse(url);
  if (uri == null) return false;
  if (uri.scheme == 'https') return uri.host.isNotEmpty;
  if (uri.scheme.isNotEmpty) return false;
  return uri.path.isNotEmpty;
}

bool isSafeEmail(String email) => _emailPattern.hasMatch(email);

String? safeTelHref(String phone) {
  final digits = phone.replaceAll(RegExp(r'[^\d+]'), '');
  if (digits.isEmpty || !RegExp(r'^\+?\d{7,15}$').hasMatch(digits)) {
    return null;
  }
  return 'tel:$digits';
}

Future<void> openUrl(String url) async {
  if (!isSafeWebUrl(url)) return;
  trackEvent('outbound_click', {'url': url});
  await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
}

Future<void> openMail(String email, {String? subject}) async {
  if (!isSafeEmail(email)) return;
  trackEvent('email', {'subject': subject});
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    query: subject == null ? null : 'subject=${Uri.encodeComponent(subject)}',
  );
  await launchUrl(uri);
}

Future<void> openTel(String phone) async {
  final href = safeTelHref(phone);
  if (href == null) return;
  trackEvent('phone');
  await launchUrl(Uri.parse(href));
}

Future<void> openResume() async {
  trackEvent('resume');
  await launchUrl(
    Uri.parse('assets/assets/docs/emmanuel_resume.pdf'),
    webOnlyWindowName: '_blank',
  );
}
