{ hostMeta, ... }:

{
  home.sessionVariables = {
    DOTFILES_HOST = hostMeta.name;
    DOTFILES_FQDN = "${hostMeta.name}.${hostMeta.domain}";
  };

  programs.fish.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#${hostMeta.name}";
  };
}
