_: {
  time.timeZone = "Europe/Stockholm";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
      "sv_SE.UTF-8/UTF-8"
      "pl_PL.UTF-8/UTF-8"
      "es_ES.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_TIME = "sv_SE.UTF-8";
    };
  };
}
