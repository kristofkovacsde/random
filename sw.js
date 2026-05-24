const CACHE = 'db-begriffe-v2';

const PRECACHE_LOCAL = [
  '/',
  '/index.html',
  '/app.jsx',
  '/data.js',
  '/styles.css',
  '/images/01-terminologie-erdbauwerk.jpg',
  '/images/02-regelquerschnitt-bahnkoerper.png',
  '/images/03-zustandsterminologie.png',
  '/images/04-gleisgeometrie-fachworterbuch.png',
];

const PRECACHE_CDN = [
  'https://unpkg.com/react@18.3.1/umd/react.development.js',
  'https://unpkg.com/react-dom@18.3.1/umd/react-dom.development.js',
  'https://unpkg.com/@babel/standalone@7.29.0/babel.min.js',
];

self.addEventListener('install', evt => {
  evt.waitUntil(
    caches.open(CACHE).then(async cache => {
      await cache.addAll(PRECACHE_LOCAL);
      await Promise.allSettled(
        PRECACHE_CDN.map(url =>
          fetch(url)
            .then(res => { if (res.ok) return cache.put(url, res); })
            .catch(() => {})
        )
      );
    }).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', evt => {
  evt.waitUntil(
    caches.keys()
      .then(keys => Promise.all(
        keys.filter(k => k !== CACHE).map(k => caches.delete(k))
      ))
      .then(() => self.clients.claim())
  );
});

// Cache-first: serve from cache, fall back to network and store new responses
self.addEventListener('fetch', evt => {
  if (evt.request.method !== 'GET') return;

  evt.respondWith(
    caches.match(evt.request).then(hit => {
      if (hit) return hit;

      return fetch(evt.request).then(res => {
        if (res.ok || res.type === 'opaque') {
          caches.open(CACHE).then(c => c.put(evt.request, res.clone()));
        }
        return res;
      }).catch(() => {
        return new Response('Offline – Ressource nicht im Cache.', {
          status: 503,
          headers: { 'Content-Type': 'text/plain; charset=utf-8' }
        });
      });
    })
  );
});
