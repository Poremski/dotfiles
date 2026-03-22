{ pkgs, ... }:

{
  imports = [
    ../../modules/git.nix
    ../../modules/fish.nix
    ../../modules/neovim.nix
    ../../modules/dev.nix
  ];

  home.username = "javier";
  home.homeDirectory = "/home/javier";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs.htop
  ];
}
