{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.nodejs
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
