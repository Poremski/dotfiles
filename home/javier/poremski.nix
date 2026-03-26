{ hostMeta, ... }:

{
  home.sessionVariables = {
    DOTFILES_HOST = hostMeta.name;
    DOTFILES_FQDN = "${hostMeta.name}.${hostMeta.domain}";
  };

  xdg.configFile."plasma-localerc".text = ''
    [Formats]
    LANG=en_US.UTF-8
    LC_TIME=sv_SE.UTF-8
  '';

  programs.fish.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#${hostMeta.name}";
  };
}
