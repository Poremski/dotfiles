{nixos-hardware, ...}: {
  imports = [
    ./hardware-configuration.nix
    nixos-hardware.nixosModules.dell-xps-13-9370
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
    ../../modules/nixos/desktop/hyprland.nix
  ];

  boot.initrd.luks.devices."luks-6bf5b651-af04-48b2-b09e-b62eb02653ab".device =
    "/dev/disk/by-uuid/6bf5b651-af04-48b2-b09e-b62eb02653ab";

  systemd.sleep.settings.Sleep = {
    AllowHibernation = "no";
  };

  system.stateVersion = "25.11";
}
