{ ... }:

{
  time.timeZone = "Europe/Stockholm";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "en_SE.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
    LC_TIME = "en_SE.UTF-8";
  };
}
