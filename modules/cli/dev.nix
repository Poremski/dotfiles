{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.cargo
    pkgs.gcc
    pkgs.go
    pkgs.gnumake
    pkgs.jdk
    pkgs.lua
    pkgs.nodejs
    pkgs.php
    pkgs.python3
    pkgs.rustc
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
