export interface RoleItem {
  id: string;
  company: string;
  title: string;
  period: string;
  location: string;
  summary: string;
  highlights: string[];
}

export const rolesData: RoleItem[] = [
  {
    id: 'tractrac',
    company: 'Tractrac Mechanisation Services Limited',
    title: 'Mobile Engineer',
    period: 'Apr 2025 to Present',
    location: 'Hybrid, Abuja',
    summary: 'Building and shipping three production mobile apps that serve 3,000+ farmers, tractor owners, and field agents across Nigeria.',
    highlights: [
      'Shipped Tractrac Plus, Tractrac Agent, and Atom Office on Android and iOS.',
      'Engineered offline farm size measurement with polygon geofencing so land can be assessed with zero connectivity.',
      'Built offline first booking and tracking with background sync for low connectivity rural use.',
      'Defined API contracts with backend engineers and contributed to farm service and tractor deployment system design.',
      'Sole mobile engineer on Atom Office: real time staff activity, attendance, task oversight, and daily reporting.',
    ],
  },
  {
    id: 'blending-bytes',
    company: 'Blending Bytes Technologies',
    title: 'Mobile Engineer',
    period: 'Oct 2023 to May 2025',
    location: 'Remote',
    summary: 'Sole mobile engineer on three live apps spanning car ecommerce, dealer tooling, and telemedicine.',
    highlights: [
      'Autovendy: vehicle marketplace with checkout and real time inventory sync on iOS and Android.',
      'Autovendy Dealer: custom camera with 360° capture, panorama, 0.5x wide angle, native channel integration, and offline listing auto sync.',
      'Medik: telemedicine for consultations, AI consultancy, drug purchases, subscriptions, and lab bookings.',
      'Architected REST integrations with Hive caching to keep booking and listing flows fast.',
      'Worked with designers to ship pixel accurate, responsive interfaces on both platforms.',
    ],
  },
  {
    id: 'hngx',
    company: 'HNGx',
    title: 'Mobile Engineer',
    period: 'Sep 2023 to Nov 2023',
    location: 'Remote',
    summary: 'Finalist in the top 300 of 22,000+ participants in a highly competitive internship. Shipped mobile apps under tight deadlines with global remote teams.',
    highlights: [
      'Delivered cross platform features on compressed timelines.',
      'Practised real world collaboration, review, and delivery discipline.',
    ],
  },
  {
    id: 'ruban',
    company: 'Ruban Technology',
    title: 'Mobile Engineer',
    period: 'Jul 2022 to Aug 2023',
    location: 'Hybrid, Gwarinpa, Abuja',
    summary: 'Shipped production mobile apps for field operations and enterprise workflows, with a focus on speed on low end Android.',
    highlights: [
      'Built capture, validation, and automated bill calculation flows for field teams.',
      'Profiled and cut jank on low end Android by shrinking rebuilds and moving heavy work off the UI thread.',
      'Simplified data entry UX for high pressure, real world use.',
    ],
  },
];
