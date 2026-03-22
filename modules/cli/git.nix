{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Javier Poremski";
      user.email = "javier@poremski.se";
      init.defaultBranch = "master";
    };
  };
}
