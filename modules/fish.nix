{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      nix-your-shell fish | source
    '';

    shellAliases = {
      ll = "ls -la";
      hm = "home-manager";
      rebuild = "home-manager switch --flake ~/.dotfiles#javier-poremski";
    };
  };
}
