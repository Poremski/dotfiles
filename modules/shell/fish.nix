{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      nix-your-shell fish | source
    '';

    shellAliases = {
      g = "git";
      v = "nvim";
      ll = "ls -la";
      hm = "home-manager";
      hms = "home-manager switch";
    };
  };
}
