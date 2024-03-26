function onInstall(event) {
  console.log('[Service Worker]', 'Installing!', event);
}

function onActivate(event) {
  console.log('[Service Worker]', 'Activating!', event);
}

function onFetch(event) {
  console.log('[Service Worker]', 'Fetching!', event);
}

self.addEventListener('install', onInstall);
self.addEventListener('activate', onActivate);
self.addEventListener('fetch', onFetch);

self.addEventListener('backgroundfetchsuccess', (event) => {
  event.waitUntil(async function () {
    const bgFetch = event.registration;
    const records = await bgFetch.matchAll();

    console.log('[Service Worker]', 'Background fetch success!', records);

    // Process fetched records here
    for (const record of records) {
      console.log('[Service Worker]', 'Fetched record:', record);
    }
  }());
});

// Listen for beforeunload event to trigger cache deletion
self.addEventListener('beforeunload', (event) => {
  // Add code here to delete cached data when the website is closed
});

self.addEventListener('push', (event) => {
  try {
    const data = event.data.text();
    self.registration.showNotification(data.title, {
      body: data.body,
      icon: '/assets/images/box.png',
    });
  } catch (error) {
    console.error('[Service Worker]', 'Error processing push event:', error);
  }
});
