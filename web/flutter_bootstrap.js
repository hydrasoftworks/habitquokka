{{flutter_js}}
{{flutter_build_config}}

const loading = document.querySelector("#loading");
_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine({
        useColorEmoji: true,
      });
    loading.classList.add("init_done");

    await appRunner.runApp();

      // Wait a few milliseconds so users can see the "zoooom" animation
      // before getting rid of the "loading" div.
      window.setTimeout(function () {
        loading.remove();
      }, 200);
  }
});
