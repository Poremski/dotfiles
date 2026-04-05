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
      gopls
      jdt-language-server
      nixd
      lua-language-server
      phpactor
      pyright
      ripgrep
      rust-analyzer
      stylua
      taplo
      typescript
      typescript-language-server
      vscode-langservers-extracted
    ];
  };

  home.file.".config/nvim".source = ../../config/nvim;
}
