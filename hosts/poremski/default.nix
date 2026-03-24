{ ... }:

{
  imports = [
    ../../modules/nixos/base.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/networking.nix
  ];

  system.stateVersion = "23.11";
}
