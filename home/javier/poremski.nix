{ ... }:

{
  imports = [
    ./common.nix
  ];

  home.sessionVariables = {
    DOTFILES_HOST = "poremski";
    DOTFILES_FQDN = "poremski.home.arpa";
  };
}
