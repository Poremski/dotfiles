{ ... }:

{
  imports = [
    ../../modules/cli
    ../../modules/shell
    ../../modules/editors
  ];

  home.username = "javier";
  home.homeDirectory = "/home/javier";

  home.stateVersion = "23.11";
}
