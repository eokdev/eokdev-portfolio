{{flutter_js}}
{{flutter_build_config}}

function waitForChromeIosViewport() {
  return new Promise(function (resolve) {
    if (!/CriOS/i.test(navigator.userAgent)) {
      resolve();
      return;
    }
    var last = 0;
    var stable = 0;
    var started = Date.now();
    function check() {
      var height = window.innerHeight || 0;
      if (window.visualViewport) {
        height = Math.max(height, window.visualViewport.height || 0);
      }
      if (height > 100 && Math.abs(height - last) < 2) {
        stable += 1;
      } else {
        stable = 0;
      }
      last = height;
      if (stable >= 4 || Date.now() - started > 600) {
        resolve();
        return;
      }
      requestAnimationFrame(check);
    }
    requestAnimationFrame(check);
  });
}

function nudgeChromeIos() {
  if (!/CriOS/i.test(navigator.userAgent)) return;
  window.dispatchEvent(new Event('resize'));
}

_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    await waitForChromeIosViewport();
    const appRunner = await engineInitializer.initializeEngine({
      hostElement: document.getElementById('flutter-host'),
    });
    await appRunner.runApp();
    [0, 80, 200, 500].forEach(function (ms) {
      setTimeout(nudgeChromeIos, ms);
    });
  },
});
