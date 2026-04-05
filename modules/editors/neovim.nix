{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPython3Packages = ps: [
      ps.pynvim
    ];
    extraPackages = with pkgs; [
      fd
      nixd
      lua-language-server
      ripgrep
      stylua
    ];
  };

  home.file.".config/nvim".source = ../../config/nvim;
}
