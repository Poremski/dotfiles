{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      g = "git";
      v = "nvim";
      zed = "zeditor";
      ll = "ls -la";
      hm = "home-manager";
      hms = "home-manager switch";
    };
  };
}
