{ lib, ... }:

{
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
        blkDev = "/dev/disk/by-uuid/bc4b7c5e-f234-48cd-9edf-01d7ea06bff9";
        label = "swap";
      };
    }
  ];

  systemd.sleep.settings.Sleep = {
    AllowHibernation = "no";
  };

  system.stateVersion = "25.11";
}
