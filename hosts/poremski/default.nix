{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/base.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/1password.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/laptop.nix
    ../../modules/nixos/printing.nix
    ../../modules/nixos/desktop/plasma.nix
  ];

  system.stateVersion = "25.11";
}
