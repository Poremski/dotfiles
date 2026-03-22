{ ... }:

{
  imports = [
    ./common.nix
  ];

  home.sessionVariables = {
    DOTFILES_HOST = "poremski";
    DOTFILES_FQDN = "poremski.home.arpa";
  };

  programs.fish.shellAliases = {
    rebuild = "home-manager switch --flake ~/.dotfiles#javier-poremski";
  };
}
