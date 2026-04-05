{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.nodejs
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];

  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.local
  '';

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
