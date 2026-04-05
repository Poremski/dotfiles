{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/base.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/1password.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/mullvad-vpn.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/laptop.nix
    ../../modules/nixos/printing.nix
    ../../modules/nixos/desktop/plasma.nix
  ];

  swapDevices = lib.mkForce [
    {
      device = "/dev/mapper/swap";
      discardPolicy = "once";
      encrypted = {
        enable = true;
        blkDev = "/dev/disk/by-uuid/c9fbf459-1737-46ef-95ca-ac8ac9d7ecd4";
        label = "swap";
      };
    }
  ];

  systemd.sleep.settings.Sleep = {
    AllowHibernation = "no";
  };

  system.stateVersion = "25.11";
}
