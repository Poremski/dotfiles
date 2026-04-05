{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.cargo
    pkgs.gcc
    pkgs.gh
    pkgs.go
    pkgs.gnumake
    pkgs.jdk
    pkgs.lua5_1
    pkgs.luarocks
    pkgs.nodejs
    pkgs.php
    pkgs.python3
    pkgs.rustPackages.clippy
    pkgs.rustPackages.rustfmt
    pkgs.rustc
    pkgs.wl-clipboard
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
    "${config.home.homeDirectory}/.nix-config/bin"
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
