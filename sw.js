
self.addEventListener('install', (e)=>{
  e.waitUntil(caches.open('wt-cache-v9').then(c=>c.addAll([
    '/', '/index.html','/assets/tailwind.css','/js/hero.js','/js/common.js','/assets/icons/favicon.png','/assets/media/hero1.mp4','/assets/media/heromain.mp4','/assets/hero-main.mp4','/assets/thumbnail.mp4','/assets/thumbnail.png','/assets/watermark.png','/assets/icons/favicon.ico'
  ])));
});
self.addEventListener('fetch', (e)=>{
  e.respondWith(caches.match(e.request).then(r=> r || fetch(e.request)));
});
