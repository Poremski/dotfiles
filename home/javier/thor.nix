{hostMeta, ...}: {
  home.sessionVariables = {
    DOTFILES_HOST = hostMeta.name;
    DOTFILES_FQDN = "${hostMeta.name}.${hostMeta.domain}";
  };
}
