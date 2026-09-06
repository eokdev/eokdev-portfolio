class Profile {
  const Profile({
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.location,
    required this.email,
    required this.phones,
    required this.github,
    required this.linkedin,
    required this.summary,
    required this.languages,
  });

  final String firstName;
  final String lastName;
  final String title;
  final String location;
  final String email;
  final List<String> phones;
  final String github;
  final String linkedin;
  final String summary;
  final List<String> languages;

  String get fullName => '$firstName $lastName';
}

class Stat {
  const Stat({
    required this.value,
    required this.label,
    this.liveDownloads = false,
  });

  final String value;
  final String label;
  final bool liveDownloads;
}

class SkillGroup {
  const SkillGroup({required this.title, required this.items});

  final String title;
  final List<String> items;
}

class Role {
  const Role({
    required this.company,
    required this.title,
    required this.period,
    required this.mode,
    required this.summary,
    required this.highlights,
  });

  final String company;
  final String title;
  final String period;
  final String mode;
  final String summary;
  final List<String> highlights;
}

class Project {
  const Project({
    required this.index,
    required this.name,
    required this.category,
    required this.blurb,
    required this.highlights,
    required this.tags,
    this.androidUrl,
    this.iosUrl,
    this.internal = false,
    this.featured = false,
    this.screenshots = const [],
  });

  final String index;
  final String name;
  final String category;
  final String blurb;
  final List<String> highlights;
  final List<String> tags;
  final String? androidUrl;
  final String? iosUrl;
  final bool internal;
  final bool featured;
  final List<String> screenshots;
}

class Education {
  const Education({
    required this.school,
    required this.degree,
    required this.period,
    required this.place,
  });

  final String school;
  final String degree;
  final String period;
  final String place;
}

abstract final class PortfolioData {
  static const profile = Profile(
    firstName: 'Emmanuel',
    lastName: 'Olorunshola',
    title: 'Flutter Engineer',
    location: 'Abuja, Nigeria',
    email: 'eokdeveloper@gmail.com',
    phones: ['+234 706 082 3080', '+234 813 449 5096'],
    github: 'https://github.com/eokdev',
    linkedin: 'https://www.linkedin.com/in/emmanuel-olorunshola-965909232',
    summary:
        'Flutter engineer with 5+ years shipping production Android and iOS apps. The work covers marketplaces, ecommerce, fintech, telemedicine, social, and operations. If it belongs on a phone, I will build it.',
    languages: ['English', 'Yoruba', 'Hausa'],
  );

  static const stats = [
    Stat(value: '5+', label: 'Years shipping'),
    Stat(value: '13+', label: 'Production apps'),
    Stat(
      value: '100K+',
      label: 'App downloads',
      liveDownloads: true,
    ),
    Stat(value: 'Top 300', label: 'HNGx of 22,000+'),
  ];

  static const skillGroups = [
    SkillGroup(
      title: 'Core',
      items: [
        'Dart',
        'Flutter',
        'Android',
        'iOS',
        'Clean Architecture',
        'MVVM',
        'MVC',
      ],
    ),
    SkillGroup(
      title: 'State & data',
      items: [
        'Riverpod',
        'Provider',
        'BLoC',
        'REST',
        'GraphQL',
        'SQLite',
        'Hive',
        'Shared Preferences',
      ],
    ),
    SkillGroup(
      title: 'Platform',
      items: [
        'Firebase Auth',
        'Firestore',
        'FCM',
        'WebSockets',
        'Deep linking',
        'Google Maps',
        'Geofencing',
        'Bluetooth printing',
      ],
    ),
    SkillGroup(
      title: 'Product',
      items: [
        'Paystack',
        'Stripe',
        'Apple Pay',
        'Google Pay',
        'In-app purchases',
        'GoCardless',
        'CI/CD',
        'Git',
        'Unit / widget / integration tests',
        'Animations',
      ],
    ),
  ];

  static const roles = [
    Role(
      company: 'Tractrac Mechanisation Services',
      title: 'Flutter Developer',
      period: 'Apr 2025 - Present',
      mode: 'Hybrid',
      summary:
          'Building and shipping three production Flutter apps that serve 3,000+ farmers, tractor owners, and field agents across Nigeria.',
      highlights: [
        'Shipped Tractrac Plus, Tractrac Agent, and Atom Office on Android and iOS.',
        'Engineered offline farm-size measurement with polygon geofencing so land can be assessed with zero connectivity.',
        'Built offline-first booking and tracking with background sync for low-connectivity rural use.',
        'Defined API contracts with backend engineers and contributed to farm-service and tractor-deployment system design.',
        'Sole Flutter developer on Atom Office: real-time staff activity, attendance, task oversight, and daily reporting.',
      ],
    ),
    Role(
      company: 'Blending Bytes Technologies',
      title: 'Flutter Developer',
      period: 'Oct 2023 - May 2025',
      mode: 'Remote',
      summary:
          'Sole Flutter engineer on three live apps spanning car e-commerce, dealer tooling, and telemedicine.',
      highlights: [
        'Autovendy: vehicle marketplace with checkout and real-time inventory sync on iOS and Android.',
        'Autovendy Dealer: custom camera with 360° capture, panorama, 0.5x wide-angle, native channel integration, and offline listing auto-sync.',
        'Medik: telemedicine for consultations, AI consultancy, drug purchases, subscriptions, and lab bookings.',
        'Architected REST integrations with Hive caching to keep booking and listing flows fast.',
        'Worked with designers to ship pixel-accurate, responsive interfaces on both platforms.',
      ],
    ),
    Role(
      company: 'HNGx',
      title: 'Flutter Developer',
      period: 'Sep 2023 - Nov 2023',
      mode: 'Remote',
      summary:
          'Finalist in the top 300 of 22,000+ participants in a highly competitive internship. Shipped Flutter apps under tight deadlines with global remote teams.',
      highlights: [
        'Delivered cross-platform features on compressed timelines.',
        'Practised real-world collaboration, review, and delivery discipline.',
      ],
    ),
    Role(
      company: 'Ruban Technology',
      title: 'Flutter Developer',
      period: 'Jul 2022 - Aug 2023',
      mode: 'Hybrid · Gwarinpa, Abuja',
      summary:
          'Shipped production Flutter apps for field operations and enterprise workflows, with a focus on speed on low-end Android.',
      highlights: [
        'Built capture, validation, and automated bill-calculation flows for field teams.',
        'Profiled and cut jank on low-end Android by shrinking rebuilds and moving heavy work off the UI thread.',
        'Simplified data-entry UX for high-pressure, real-world use.',
      ],
    ),
  ];

  static const projects = [
    Project(
      index: '01',
      name: 'Dream Planet',
      category: 'Creator economy',
      featured: true,
      blurb:
          'Mobile lead on a social marketplace where creators grow audiences, fund ideas, and monetise work. I still maintain the app and ship add-on features.',
      highlights: [
        'Profiles, campaigns, digital sales, merch, and services',
        'Paystack, Stripe, and Apple Pay',
        'Ongoing maintenance and new feature work',
      ],
      tags: ['Flutter', 'Payments', 'Leadership', 'Android', 'iOS'],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.dreamplanet.app',
      iosUrl:
          'https://apps.apple.com/us/app/dream-planet-for-creators/id6738397299',
      screenshots: [
        'assets/images/apps/dream_planet/ios_01.jpg',
        'assets/images/apps/dream_planet/ios_02.jpg',
        'assets/images/apps/dream_planet/ios_03.jpg',
        'assets/images/apps/dream_planet/ios_04.jpg',
        'assets/images/apps/dream_planet/ios_05.jpg',
        'assets/images/apps/dream_planet/ios_06.jpg',
      ],
    ),
    Project(
      index: '02',
      name: 'Tractrac Plus',
      category: 'AgriTech · Marketplace',
      featured: true,
      blurb:
          'The farmer and tractor-owner app for mechanisation services across Nigeria. Book implements, measure land, and hire tractors, including when you are offline.',
      highlights: [
        'Offline polygon geofencing for farm-size measurement',
        'Service booking and tracking with background sync',
        'Live for 3,000+ farmers and owners',
      ],
      tags: ['Flutter', 'Maps', 'Offline-first', 'Android', 'iOS'],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.tractrac.plus',
      iosUrl: 'https://apps.apple.com/us/app/tractrac-plus/id6754968082',
      screenshots: [
        'assets/images/apps/tractrac_plus/ios_01.jpg',
        'assets/images/apps/tractrac_plus/ios_02.jpg',
        'assets/images/apps/tractrac_plus/ios_03.jpg',
        'assets/images/apps/tractrac_plus/ios_04.jpg',
      ],
    ),
    Project(
      index: '03',
      name: 'Tractrac Agent',
      category: 'AgriTech · Operations',
      featured: true,
      blurb:
          'The operations hub for tractor owners and booking agents. Fleet control, earnings, and demand aggregation in the field.',
      highlights: [
        'Fleet dashboards and booking management',
        'Built for onboarded agents in low-connectivity areas',
        'Shipped alongside Plus as a paired product',
      ],
      tags: ['Flutter', 'Offline-first', 'Android', 'iOS'],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.tractrac.agent',
      iosUrl: 'https://apps.apple.com/us/app/tractrac-agent/id6754979879',
      screenshots: [
        'assets/images/apps/tractrac_agent/ios_01.jpg',
        'assets/images/apps/tractrac_agent/ios_02.jpg',
        'assets/images/apps/tractrac_agent/ios_03.jpg',
        'assets/images/apps/tractrac_agent/ios_04.jpg',
      ],
    ),
    Project(
      index: '04',
      name: 'Nexodius',
      category: 'Fintech · Exchange',
      featured: true,
      blurb:
          'Nigeria digital finance app for crypto, gift-card trading, utility bills, and virtual dollar cards. Live on Play Store and the App Store.',
      highlights: [
        'Buy, sell, and cash out digital assets in one app',
        'Gift-card exchange with live rates and fast payouts',
        'Utility payments and virtual dollar cards',
      ],
      tags: ['Flutter', 'Fintech', 'Payments', 'Android', 'iOS'],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.nexodius.nexodius',
      iosUrl: 'https://apps.apple.com/ng/app/nexodius/id6761715029',
      screenshots: [
        'assets/images/apps/nexodius/ios_01.jpg',
        'assets/images/apps/nexodius/ios_02.jpg',
        'assets/images/apps/nexodius/ios_03.jpg',
        'assets/images/apps/nexodius/ios_04.jpg',
        'assets/images/apps/nexodius/ios_05.jpg',
        'assets/images/apps/nexodius/ios_06.jpg',
      ],
    ),
    Project(
      index: '05',
      name: 'Autovendy',
      category: 'E-commerce · Automotive',
      featured: true,
      blurb:
          'Nigeria used-car marketplace for listing, browsing, and buying vehicles, with live inventory and checkout across payment methods.',
      highlights: [
        'Payments via Stripe, Apple Pay, Google Pay, and in-app purchase',
        'Real-time inventory sync',
        'Pixel-accurate consumer UI on both stores',
      ],
      tags: ['Flutter', 'Payments', 'REST', 'Hive', 'Android', 'iOS'],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.autovendy.app',
      iosUrl:
          'https://apps.apple.com/us/app/autovendy-buy-sell-used-car/id6503488504',
      screenshots: [
        'assets/images/apps/autovendy/play_01.webp',
        'assets/images/apps/autovendy/play_02.webp',
        'assets/images/apps/autovendy/play_03.webp',
        'assets/images/apps/autovendy/play_04.webp',
        'assets/images/apps/autovendy/play_05.webp',
      ],
    ),
    Project(
      index: '06',
      name: 'Medik',
      category: 'Telemedicine',
      featured: true,
      blurb:
          'Consultations, AI consultancy, drug purchases, subscriptions, and lab bookings on Android, with in-app payments and cached API flows.',
      highlights: [
        'AI consultancy alongside doctor consultations',
        'Health subscriptions and lab booking',
        'Paystack in-app transactions',
      ],
      tags: ['Flutter', 'Paystack', 'REST', 'AI', 'Android'],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.medik.apppublic',
      screenshots: [
        'assets/images/apps/medik/play_03.webp',
        'assets/images/apps/medik/play_04.webp',
        'assets/images/apps/medik/play_05.webp',
        'assets/images/apps/medik/play_06.webp',
        'assets/images/apps/medik/play_07.webp',
        'assets/images/apps/medik/play_08.webp',
      ],
    ),
    Project(
      index: '07',
      name: 'Ikore PATH',
      category: 'Field ops · Analytics',
      featured: true,
      blurb:
          'Project Analytics, Tracking, and Harmonization. A field data and project-management app for Ikore International, live on Google Play.',
      highlights: [
        'Structured field data capture and project tracking',
        'Works in low-connectivity environments, then syncs',
        'Analytics for monitoring, evaluation, and decisions',
      ],
      tags: ['Flutter', 'Field data', 'Analytics', 'Android'],
      androidUrl: 'https://play.google.com/store/apps/details?id=com.ikore.path',
      screenshots: [
        'assets/images/apps/ikore_path/play_03.webp',
        'assets/images/apps/ikore_path/play_04.webp',
        'assets/images/apps/ikore_path/play_05.webp',
        'assets/images/apps/ikore_path/play_06.webp',
        'assets/images/apps/ikore_path/play_07.webp',
        'assets/images/apps/ikore_path/play_08.webp',
      ],
    ),
    Project(
      index: '08',
      name: 'Atom Office',
      category: 'Workplace · Accountability',
      blurb:
          'Smart office management for distributed teams. Real-time staff activity, attendance, task oversight, and structured daily reporting.',
      highlights: [
        'Sole Flutter developer, iOS and Android',
        'Live activity and attendance tracking',
        'Daily reporting built for managers who need a paper trail',
      ],
      tags: ['Flutter', 'Realtime', 'Android', 'iOS'],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.tractrac.tea',
      iosUrl: 'https://apps.apple.com/ng/app/atom-office/id6758051322',
      screenshots: [
        'assets/images/apps/atom_office/ios_01.jpg',
        'assets/images/apps/atom_office/ios_02.jpg',
        'assets/images/apps/atom_office/ios_03.jpg',
        'assets/images/apps/atom_office/ios_04.jpg',
        'assets/images/apps/atom_office/ios_05.jpg',
        'assets/images/apps/atom_office/ios_06.jpg',
      ],
    ),
    Project(
      index: '09',
      name: 'Autovendy Dealer',
      category: 'Dealer tooling',
      blurb:
          'Dealer app with a custom camera stack: 360° capture, panorama, wide-angle, and offline listings that sync when the lot gets signal.',
      highlights: [
        'Native channel camera with 0.5x wide-angle',
        '360° and panorama capture for listings',
        'Offline listing mode with auto-sync',
      ],
      tags: ['Flutter', 'Camera', 'Platform channels', 'Offline', 'iOS'],
      iosUrl:
          'https://apps.apple.com/us/app/autovendy-dealer-sell-cars/id6503721466',
      screenshots: [
        'assets/images/apps/autovendy_dealer/ios_01.webp',
        'assets/images/apps/autovendy_dealer/ios_02.webp',
        'assets/images/apps/autovendy_dealer/ios_03.webp',
        'assets/images/apps/autovendy_dealer/ios_04.webp',
        'assets/images/apps/autovendy_dealer/ios_05.webp',
      ],
    ),
    Project(
      index: '10',
      name: 'Blinkers Nigeria',
      category: 'Marketplace · Deep links',
      blurb:
          'Led the move off Firebase Dynamic Links to native Android App Links and iOS Universal Links, with rich OG previews and store fallbacks.',
      highlights: [
        'Native deep links after Firebase deprecation',
        'OG metadata for product image, name, and details',
        'Smart banner fallback to Play Store / App Store',
      ],
      tags: ['Deep linking', 'Android App Links', 'Universal Links'],
      androidUrl: 'https://play.google.com/store/apps/details?id=com.app.blinkers',
      iosUrl: 'https://apps.apple.com/us/app/blinkers/id6473721412',
      screenshots: [
        'assets/images/apps/blinkers/ios_01.jpg',
        'assets/images/apps/blinkers/ios_02.jpg',
        'assets/images/apps/blinkers/ios_03.jpg',
        'assets/images/apps/blinkers/ios_04.jpg',
        'assets/images/apps/blinkers/ios_05.jpg',
        'assets/images/apps/blinkers/ios_06.jpg',
      ],
    ),
    Project(
      index: '11',
      name: 'TradeVila',
      category: 'Marketplace · Procurement',
      featured: true,
      blurb:
          'Marketplace and procurement app for MSMEs. Search categories, buy, and track spend in a trust-based trade ecosystem.',
      highlights: [
        'Home marketplace with search and category browsing',
        'Spend analytics for orders and purchases',
        'Live on Google Play',
      ],
      tags: ['Flutter', 'Marketplace', 'Analytics', 'Android'],
      androidUrl: 'https://play.google.com/store/apps/details?id=com.trade.vila',
      screenshots: [
        'assets/images/apps/tradevila/play_02.webp',
        'assets/images/apps/tradevila/play_03.webp',
        'assets/images/apps/tradevila/play_04.webp',
        'assets/images/apps/tradevila/play_05.webp',
        'assets/images/apps/tradevila/play_06.webp',
      ],
    ),
    Project(
      index: '12',
      name: 'Service Rendering App',
      category: 'Services marketplace',
      blurb:
          'Sole Flutter developer on a marketplace connecting people with artisans. Real-time chat, booking, ratings, and GoCardless payments.',
      highlights: [
        'WebSocket chat',
        'Booking and tracking',
        'GoCardless payments and reviews',
      ],
      tags: ['Flutter', 'WebSockets', 'GoCardless', 'Android', 'iOS'],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.service.rendering',
      iosUrl: 'https://apps.apple.com/ng/app/service-rendering/id6741517290',
      screenshots: [
        'assets/images/apps/service_rendering/ios_01.jpg',
        'assets/images/apps/service_rendering/ios_02.jpg',
        'assets/images/apps/service_rendering/ios_03.jpg',
        'assets/images/apps/service_rendering/ios_04.jpg',
        'assets/images/apps/service_rendering/ios_05.jpg',
        'assets/images/apps/service_rendering/ios_06.jpg',
      ],
    ),
    Project(
      index: '13',
      name: 'JustBetaPay',
      category: 'Enterprise payments · Receipts',
      internal: true,
      blurb:
          'Enterprise payments app with Bluetooth thermal printing. Field teams print a receipt from the phone the moment a payment lands.',
      highlights: [
        'Bluetooth thermal printer integration for on-the-spot receipts',
        'Print payment receipts directly from the JustBetaPay app',
        'Built so cashiers and field agents do not need a separate POS printer workflow',
      ],
      tags: ['Flutter', 'Bluetooth printing', 'Receipts', 'Payments', 'Enterprise'],
    ),
  ];

  static List<String> get playPackageIds {
    final ids = <String>[];
    for (final project in projects) {
      final url = project.androidUrl;
      if (url == null) continue;
      final id = Uri.tryParse(url)?.queryParameters['id'];
      if (id != null && id.isNotEmpty) ids.add(id);
    }
    return ids;
  }

  static const education = Education(
    school: 'Joseph Ayo Babalola University',
    degree: 'BSc Computer Science',
    period: 'Sep 2019 - Aug 2023',
    place: 'Ikeji-Arakeji, Osun State',
  );
}
