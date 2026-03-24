{ ... }:

{
  imports = [
    ../../modules/nixos/base.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/filesystems.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/laptop.nix
    ../../modules/nixos/desktop/plasma.nix
  ];

  system.stateVersion = "25.11";
}
