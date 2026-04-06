{hostMeta, ...}: {
  home.sessionVariables = {
    DOTFILES_HOST = hostMeta.name;
    DOTFILES_FQDN = "${hostMeta.name}.${hostMeta.domain}";
  };

  xdg.configFile."hypr".source = ../../config/hypr;

  xdg.configFile."waybar".source = ../../config/waybar;
}
