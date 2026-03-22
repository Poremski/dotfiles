{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      fd
      lua-language-server
      ripgrep
      stylua
    ];
  };

  home.file.".config/nvim".source = ../../config/nvim;
}
