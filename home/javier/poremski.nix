{ hostMeta, ... }:

{
  home.sessionVariables = {
    DOTFILES_HOST = hostMeta.name;
    DOTFILES_FQDN = "${hostMeta.name}.${hostMeta.domain}";
  };

  programs.fish.shellAliases = {
    rebuild = "home-manager switch --flake ~/.dotfiles#${hostMeta.user}-${hostMeta.name}";
  };
}
