_: {
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "altgr-intl";
      };
    };
  };

  console.useXkbConfig = true;

  xdg.portal.enable = true;
}
