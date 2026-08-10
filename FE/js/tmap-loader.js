(function loadTmapSdk() {
  var appKey = window.TMAP_APP_KEY;

  if (!appKey || appKey === "YOUR_TMAP_APP_KEY") {
    window.TMAP_SDK_STATUS = "missing-key";
    console.error(
      "TMAP App Key가 없습니다. tmap-config.example.js를 " +
        "tmap-config.local.js로 복사한 뒤 키를 입력해주세요."
    );
    return;
  }

  document.write(
    '<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=' +
      encodeURIComponent(appKey) +
      '" onerror="window.TMAP_SDK_STATUS=\'load-failed\'"><\/script>'
  );
})();
