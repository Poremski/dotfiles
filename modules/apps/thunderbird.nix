{ pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;

    profiles.javier = {
      isDefault = true;
    };
  };
}
