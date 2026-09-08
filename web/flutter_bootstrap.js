{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    var host = document.getElementById('flutter-host');
    function fitHost() {
      var w = window.innerWidth + 'px';
      var h = window.innerHeight + 'px';
      if (host.style.width === w && host.style.height === h) return;
      host.style.width = w;
      host.style.height = h;
    }
    if (window.__eokFitHost) {
      window.removeEventListener('resize', window.__eokFitHost);
    }
    window.__eokFitHost = fitHost;
    fitHost();
    window.addEventListener('resize', fitHost);
    const appRunner = await engineInitializer.initializeEngine({
      hostElement: host,
    });
    await appRunner.runApp();
  },
});
