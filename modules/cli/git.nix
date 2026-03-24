{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    signing = {
      format = "openpgp";
      key = "D85178CF97840B3927A80750FC7EE837A78AC7BD";
      signByDefault = true;
    };

    settings = {
      user.name = "Javier Poremski";
      user.email = "javier@poremski.se";
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      gpg.program = "gpg";
    };
  };
}
