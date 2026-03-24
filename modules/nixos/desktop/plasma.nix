{ ... }:

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  console.useXkbConfig = true;

  xdg.portal.enable = true;
}
