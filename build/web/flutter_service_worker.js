'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "0512a4246aea87be03ffb731e6347966",
"version.json": "34a125e2d49c3934d0507720a9454a28",
"index.html": "3e7a33e1007952aab3b2714331951e14",
"/": "3e7a33e1007952aab3b2714331951e14",
"main.dart.js": "a1d33316276f679b6dea3f3becc7a417",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"_headers": "8a3e5ae195bf87aa3a00d4380f337682",
"favicon.png": "0df61ff10c46e6507d9e0822c4d4d585",
"icons/Icon-192.png": "e271acc028b70a03695a83adefffe26e",
"icons/Icon-maskable-192.png": "481801de75ad550c29a52939abb88bf6",
"icons/Icon-maskable-512.png": "4ea482ab620f8a68d83bb4e8e33bc728",
"icons/Icon-512.png": "138f996ecfdacf5f80cca2f421eef0d5",
"manifest.json": "f84e3e5f8ed2209ecc91d184d1746665",
"assets/NOTICES": "be4cea9d9229d4c17290e3358c99f2a9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "4aa7159667638b106fadab97a19c4f92",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "d15d351121ceca931476070eafbe69fb",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "31cab4b8ed7b58895254ecdce6441878",
"assets/fonts/MaterialIcons-Regular.otf": "0f2a7d0b2c37059a467166195ccd83a9",
"assets/assets/images/hero.jpg": "30f7bec1f090bfedd1e5dada56b5527e",
"assets/assets/images/avatar.jpg": "61ee574ac6a95f2d71566831deb6feac",
"assets/assets/images/about.jpg": "55f1e02d14df1aa98471447669c74297",
"assets/assets/images/apps/atom_office/ios_03.jpg": "d96db075cd447868270a2bdd6d49fcc2",
"assets/assets/images/apps/atom_office/ios_02.jpg": "dbf8b6e4501483553c653506ff1c6b53",
"assets/assets/images/apps/atom_office/ios_01.jpg": "dcf4d44c39d4615a3ebea3a3c185b956",
"assets/assets/images/apps/atom_office/ios_05.jpg": "c10042eaea09a3ba7046b93d06c03922",
"assets/assets/images/apps/atom_office/ios_04.jpg": "8a18df74ca5af2f23867eea1fd85e7fe",
"assets/assets/images/apps/atom_office/ios_06.jpg": "eda681148fb0998e0879439853db1b11",
"assets/assets/images/apps/tractrac_plus/ios_03.jpg": "a8c89e7a3a163ebb38f40e49ddf17ae7",
"assets/assets/images/apps/tractrac_plus/ios_02.jpg": "e49091076633defec49cf82b65fb1b64",
"assets/assets/images/apps/tractrac_plus/ios_01.jpg": "853c89251fa1734e12e4cc9a59f292b2",
"assets/assets/images/apps/tractrac_plus/ios_04.jpg": "56a1476762993491d634713ee562c3f0",
"assets/assets/images/apps/dream_planet/ios_03.jpg": "bed5cc7f23a145f519559b9700056b21",
"assets/assets/images/apps/dream_planet/ios_02.jpg": "cb65b35aac1cd63ae149b531163d8ce5",
"assets/assets/images/apps/dream_planet/ios_01.jpg": "b87c21dd6a98e5445c1dc4b581286e92",
"assets/assets/images/apps/dream_planet/ios_05.jpg": "94ff4de2009c39de5dc25689ada399a0",
"assets/assets/images/apps/dream_planet/ios_04.jpg": "2c9f868f84a1e340e3fd17f5a2a3f270",
"assets/assets/images/apps/dream_planet/ios_06.jpg": "776fa7528ea845357e9514c04de3d4f6",
"assets/assets/images/apps/ikore_path/play_07.webp": "44a1115c585656611f5aef865e8fd0cc",
"assets/assets/images/apps/ikore_path/play_06.webp": "becaa079656a40678673b7d6bb27b856",
"assets/assets/images/apps/ikore_path/play_03.webp": "f254a48a01a8771e052d97c5bb7ffd7f",
"assets/assets/images/apps/ikore_path/play_05.webp": "d305a79fa795fea2c97a9a726e384bb0",
"assets/assets/images/apps/ikore_path/play_04.webp": "a1f46b36b54477f0d98af214dcc7492c",
"assets/assets/images/apps/ikore_path/play_08.webp": "161bae4608461b5a52cfcda433c26988",
"assets/assets/images/apps/blinkers/ios_03.jpg": "8bbf328dcda7884af223f6eab3d24cca",
"assets/assets/images/apps/blinkers/ios_02.jpg": "23b98792a4847df603700fc7c87c6548",
"assets/assets/images/apps/blinkers/ios_01.jpg": "88d80364d432a17965081af8ea189ae3",
"assets/assets/images/apps/blinkers/ios_05.jpg": "2d5c422aad90c455e99b9212504a2282",
"assets/assets/images/apps/blinkers/ios_04.jpg": "08d1079d982e8e4bbc6deeaed0ddc537",
"assets/assets/images/apps/blinkers/ios_06.jpg": "fdf7d692e38177ecc3119937704911df",
"assets/assets/images/apps/autovendy_dealer/ios_01.webp": "121f647f1134f169f386074d3d1706bf",
"assets/assets/images/apps/autovendy_dealer/ios_05.webp": "9f81edd2df24d2a47fd3b645d0db0ada",
"assets/assets/images/apps/autovendy_dealer/ios_04.webp": "f0d2c9e77342d319f5917423c32770e7",
"assets/assets/images/apps/autovendy_dealer/ios_03.webp": "e6f586326b6346580516b61c16d77535",
"assets/assets/images/apps/autovendy_dealer/ios_02.webp": "696a6f865e00891596fc60907ccf42f6",
"assets/assets/images/apps/tractrac_agent/ios_03.jpg": "59549ea8c7514e2c5e574eb892c1bfec",
"assets/assets/images/apps/tractrac_agent/ios_02.jpg": "b2a6a0f17771ba26dab53374a8156149",
"assets/assets/images/apps/tractrac_agent/ios_01.jpg": "f22680cba3c91544f2360069a9b286d9",
"assets/assets/images/apps/tractrac_agent/ios_04.jpg": "9d670a456e3bee5453ec33d6b87a7c6d",
"assets/assets/images/apps/medik/play_07.webp": "ea1dc062e0c40d8a12c66f358b487668",
"assets/assets/images/apps/medik/play_06.webp": "4a6f05133bcc2c0a01e453698dde4452",
"assets/assets/images/apps/medik/play_03.webp": "4e8ab260799118c1f5ecaac7d97f5a5e",
"assets/assets/images/apps/medik/play_05.webp": "29fb88ec003ab2a14caf91bd37670ead",
"assets/assets/images/apps/medik/play_04.webp": "d8aba3256211b1343b013d16191ae119",
"assets/assets/images/apps/medik/play_08.webp": "dbd11050283d2123b9e75f2ecd4f0748",
"assets/assets/images/apps/service_rendering/ios_03.jpg": "9259dd588a55e5a663b05042e3e85d53",
"assets/assets/images/apps/service_rendering/ios_02.jpg": "42ae64caf17543423d973c139427d0ab",
"assets/assets/images/apps/service_rendering/ios_01.jpg": "ae76d87176a82793d22e4d742ea36aea",
"assets/assets/images/apps/service_rendering/ios_05.jpg": "c76d0041e8575c84d18772cf3235797b",
"assets/assets/images/apps/service_rendering/ios_04.jpg": "b8dc6790c756f851845d377e9a68fbbd",
"assets/assets/images/apps/service_rendering/ios_06.jpg": "21bfe9ea8893fbda66adbbad25648a48",
"assets/assets/images/apps/tradevila/play_06.webp": "9964987859fa702c6041ec62e03ae7d5",
"assets/assets/images/apps/tradevila/play_01.webp": "cec1ffd62cd37bd334c738412c051b00",
"assets/assets/images/apps/tradevila/play_03.webp": "f65b15a02afab095141ec52061f4ca3e",
"assets/assets/images/apps/tradevila/play_02.webp": "31a0190e07c8439ab77cacd6bd4d308a",
"assets/assets/images/apps/tradevila/play_05.webp": "e830cd8b82c826a5713863d3af75c643",
"assets/assets/images/apps/tradevila/play_04.webp": "5ea54d0d118d2f39d22f394950c85224",
"assets/assets/images/apps/autovendy/play_01.webp": "8eb0c07c57d3e78e6e417c4b7da481ea",
"assets/assets/images/apps/autovendy/play_03.webp": "526a068b6319596f8c230ec564124d0e",
"assets/assets/images/apps/autovendy/play_02.webp": "63c3028f6eecbac969903b446564c1d4",
"assets/assets/images/apps/autovendy/play_05.webp": "a333fadfa6d9e8c87bb066a8c1221146",
"assets/assets/images/apps/autovendy/play_04.webp": "611bec5f045655bb048961715c34e376",
"assets/assets/images/apps/nexodius/play_07.webp": "b18ae5a654847f0f625bdc1c19b4d3ee",
"assets/assets/images/apps/nexodius/play_06.webp": "3fb8cc56702f939babf8c9e1303c72c6",
"assets/assets/images/apps/nexodius/ios_03.jpg": "555e2dd6b60ddb950e0f728fda162bf8",
"assets/assets/images/apps/nexodius/ios_02.jpg": "ce92341a7ce74cc88b7d33fbd33b2d5e",
"assets/assets/images/apps/nexodius/ios_01.jpg": "441bf98ff3fa6f0e7f665c0534afbde6",
"assets/assets/images/apps/nexodius/ios_05.jpg": "f1bc9cd4ed81d4f68c90636176d543d4",
"assets/assets/images/apps/nexodius/ios_04.jpg": "351d396df0866c5a09a498b67695abd3",
"assets/assets/images/apps/nexodius/ios_06.jpg": "bd3e0dc1ad337e7de92819814c98a510",
"assets/assets/images/apps/nexodius/play_03.webp": "5c81c7122ce0a5723c743f65d887b2b1",
"assets/assets/images/apps/nexodius/play_05.webp": "29d01525168f7547d9c4167b2cb95ca1",
"assets/assets/images/apps/nexodius/play_04.webp": "cf8f45b5491fcdefee3f62d46c497eb8",
"assets/assets/images/apps/nexodius/play_08.webp": "8f1d9cafd7f4ff0222d87bffe2fca2fa",
"assets/assets/docs/emmanuel_resume.pdf": "cedef713ef5da90461e56771ec90cbf5",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
