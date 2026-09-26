export interface ProjectItem {
  id: string;
  index: string;
  name: string;
  category: string;
  year: string;
  blurb: string;
  tags: string[];
  image: string;
  gallery: string[];
  androidUrl?: string;
  iosUrl?: string;
}

export const projectsData: ProjectItem[] = [
  {
    id: 'dream-planet',
    index: '01',
    name: 'Dream Planet',
    category: 'Creator Economy & Social',
    year: '2025',
    blurb: 'Social marketplace where creators grow audiences, fund ideas, and monetise work with multi-currency checkout.',
    tags: ['Flutter', 'Stripe', 'Apple Pay', 'iOS', 'Android'],
    image: '/images/apps/dream_planet/ios_01.jpg',
    gallery: [
      '/images/apps/dream_planet/ios_01.jpg',
      '/images/apps/dream_planet/ios_02.jpg',
      '/images/apps/dream_planet/ios_03.jpg',
    ],
    androidUrl: 'https://play.google.com/store/apps/details?id=com.dreamplanet.app',
    iosUrl: 'https://apps.apple.com/us/app/dream-planet-for-creators/id6738397299',
  },
  {
    id: 'tractrac-plus',
    index: '02',
    name: 'Tractrac Plus',
    category: 'AgriTech & Operations',
    year: '2025',
    blurb: 'Mechanisation platform for Nigerian farmers and tractor owners. Includes offline polygon geofencing and booking sync.',
    tags: ['Flutter', 'Offline First', 'Google Maps', 'iOS', 'Android'],
    image: '/images/apps/tractrac_plus/ios_01.jpg',
    gallery: [
      '/images/apps/tractrac_plus/ios_01.jpg',
      '/images/apps/tractrac_plus/ios_02.jpg',
      '/images/apps/tractrac_plus/ios_03.jpg',
    ],
    androidUrl: 'https://play.google.com/store/apps/details?id=com.tractrac.plus',
    iosUrl: 'https://apps.apple.com/us/app/tractrac-plus/id6754968082',
  },
  {
    id: 'nexodius',
    index: '03',
    name: 'Nexodius',
    category: 'Fintech & Digital Assets',
    year: '2025',
    blurb: 'Digital finance app for digital asset exchange, gift card trading, virtual dollar cards, and automated utility settlements.',
    tags: ['Flutter', 'Fintech', 'WebSockets', 'iOS', 'Android'],
    image: '/images/apps/nexodius/ios_01.jpg',
    gallery: [
      '/images/apps/nexodius/ios_01.jpg',
      '/images/apps/nexodius/ios_02.jpg',
      '/images/apps/nexodius/ios_03.jpg',
    ],
    androidUrl: 'https://play.google.com/store/apps/details?id=com.nexodius.nexodius',
    iosUrl: 'https://apps.apple.com/ng/app/nexodius/id6761715029',
  },
  {
    id: 'autovendy',
    index: '04',
    name: 'Autovendy',
    category: 'E-Commerce & Automotive',
    year: '2024',
    blurb: 'Used-car vehicle marketplace with real-time inventory synchronization, instant checkout, and dealer integration.',
    tags: ['Flutter', 'REST', 'Hive', 'Stripe', 'iOS', 'Android'],
    image: '/images/apps/autovendy/play_01.webp',
    gallery: [
      '/images/apps/autovendy/play_01.webp',
      '/images/apps/autovendy/play_02.webp',
      '/images/apps/autovendy/play_03.webp',
    ],
    androidUrl: 'https://play.google.com/store/apps/details?id=com.autovendy.app',
    iosUrl: 'https://apps.apple.com/us/app/autovendy-buy-sell-used-car/id6503488504',
  },
  {
    id: 'medik',
    index: '05',
    name: 'Medik',
    category: 'Telemedicine & Health',
    year: '2024',
    blurb: 'Telemedicine application featuring doctor video consultations, AI diagnostics, pharmacy orders, and lab bookings.',
    tags: ['Flutter', 'AI Consult', 'Paystack', 'Android'],
    image: '/images/apps/medik/play_03.webp',
    gallery: [
      '/images/apps/medik/play_03.webp',
      '/images/apps/medik/play_04.webp',
      '/images/apps/medik/play_05.webp',
    ],
    androidUrl: 'https://play.google.com/store/apps/details?id=com.medik.apppublic',
  },
  {
    id: 'tractrac-agent',
    index: '06',
    name: 'Tractrac Agent',
    category: 'Operations Hub',
    year: '2025',
    blurb: 'Field agent hub for tractor fleet control, earnings tracking, and offline demand management in remote farming communities.',
    tags: ['Flutter', 'Fleet Management', 'Offline Sync', 'Android', 'iOS'],
    image: '/images/apps/tractrac_agent/ios_01.jpg',
    gallery: [
      '/images/apps/tractrac_agent/ios_01.jpg',
      '/images/apps/tractrac_agent/ios_02.jpg',
      '/images/apps/tractrac_agent/ios_03.jpg',
    ],
    androidUrl: 'https://play.google.com/store/apps/details?id=com.tractrac.agent',
    iosUrl: 'https://apps.apple.com/us/app/tractrac-agent/id6754979879',
  },
  {
    id: 'atom-office',
    index: '07',
    name: 'Atom Office',
    category: 'Enterprise & Workforce',
    year: '2024',
    blurb: 'Smart office operations for distributed teams. Real-time staff activity, attendance tracking, and automated reporting.',
    tags: ['Flutter', 'Realtime', 'Enterprise', 'iOS', 'Android'],
    image: '/images/apps/atom_office/ios_01.jpg',
    gallery: [
      '/images/apps/atom_office/ios_01.jpg',
      '/images/apps/atom_office/ios_02.jpg',
      '/images/apps/atom_office/ios_03.jpg',
    ],
    androidUrl: 'https://play.google.com/store/apps/details?id=com.tractrac.tea',
    iosUrl: 'https://apps.apple.com/ng/app/atom-office/id6758051322',
  },
  {
    id: 'blinkers',
    index: '08',
    name: 'Blinkers',
    category: 'Logistics & Dispatch',
    year: '2023',
    blurb: 'On-demand courier delivery and logistics coordination platform with live rider route tracking and instant settlement.',
    tags: ['Flutter', 'Routing', 'WebSockets', 'Android', 'iOS'],
    image: '/images/apps/blinkers/play_01.webp',
    gallery: [
      '/images/apps/blinkers/play_01.webp',
      '/images/apps/blinkers/play_02.webp',
    ],
  },
  {
    id: 'ikore-path',
    index: '09',
    name: 'Ikore PATH',
    category: 'Field Ops & Analytics',
    year: '2024',
    blurb: 'Project Analytics, Tracking, and Harmonization for structured international field data capture in remote territories.',
    tags: ['Flutter', 'Field Data', 'Analytics', 'Android'],
    image: '/images/apps/ikore_path/play_03.webp',
    gallery: [
      '/images/apps/ikore_path/play_03.webp',
      '/images/apps/ikore_path/play_04.webp',
    ],
    androidUrl: 'https://play.google.com/store/apps/details?id=com.ikore.path',
  },
  {
    id: 'tradevila',
    index: '10',
    name: 'TradeVila',
    category: 'Commerce & Retail',
    year: '2023',
    blurb: 'Multi-vendor retail and wholesale discovery platform connecting verified suppliers with bulk merchants.',
    tags: ['Flutter', 'Commerce', 'Paystack', 'Android'],
    image: '/images/apps/tradevila/play_01.webp',
    gallery: [
      '/images/apps/tradevila/play_01.webp',
      '/images/apps/tradevila/play_02.webp',
    ],
  },
];
