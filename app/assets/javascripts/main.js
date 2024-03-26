async function registerSync() {
    const swRegistration = await navigator.serviceWorker.ready;
    swRegistration.sync.register("send-message");
  }
  