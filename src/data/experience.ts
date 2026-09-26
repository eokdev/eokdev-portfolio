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
    company: 'Tractrac Mechanisation Services',
    title: 'Flutter Developer',
    period: '2025 / Present',
    location: 'Abuja, Nigeria',
    summary: 'Engineering production Flutter apps serving 3,000+ farmers, tractor owners, and field agents across Nigeria.',
    highlights: [
      'Shipped Tractrac Plus, Tractrac Agent, and Atom Office across Android and iOS.',
      'Engineered offline farm-size measurement with polygon geofencing for zero-connectivity field use.',
      'Architected offline-first booking and tracking with background sync.',
    ],
  },
  {
    id: 'blending-bytes',
    company: 'Blending Bytes Technologies',
    title: 'Flutter Developer',
    period: '2023 / 2025',
    location: 'Remote',
    summary: 'Sole Flutter engineer across car e-commerce, dealer tooling, and telemedicine platforms.',
    highlights: [
      'Built Autovendy vehicle marketplace with real-time inventory sync and checkout.',
      'Engineered Autovendy Dealer with custom 360 camera, panorama, and offline auto-sync.',
      'Shipped Medik telemedicine application with AI consultancy and Paystack integration.',
    ],
  },
  {
    id: 'hngx',
    company: 'HNGx Finalist',
    title: 'Flutter Developer',
    period: '2023',
    location: 'Remote',
    summary: 'Finalist in top 300 of 22,000+ participants. Shipped cross-platform features under compressed deadlines.',
    highlights: [
      'Delivered production-grade features in high-velocity remote agile sprints.',
      'Maintained rigorous code quality, testing, and continuous integration.',
    ],
  },
  {
    id: 'ruban',
    company: 'Ruban Technology',
    title: 'Flutter Developer',
    period: '2022 / 2023',
    location: 'Abuja, Nigeria',
    summary: 'Shipped production Flutter applications for field operations and enterprise workflows.',
    highlights: [
      'Eliminated UI jank on low-end Android devices through memory profiling and widget tree optimization.',
      'Built capture, validation, and automated calculation flows for field teams.',
    ],
  },
];
