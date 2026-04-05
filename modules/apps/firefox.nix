{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        # Allow declarative extensions to coexist with manually installed ones.
        "extensions.autoDisableScopes" = 0;
      };
    };
  };
}
