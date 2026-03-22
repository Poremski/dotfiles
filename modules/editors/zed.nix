{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    mutableUserSettings = false;
    mutableUserKeymaps = false;

    extraPackages = with pkgs; [
      nixd
      lua-language-server
      ripgrep
      fd
      stylua
    ];

    userSettings = {
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "dark";
        dark = "One Dark";
        light = "One Light";
      };
      icon_theme = {
        mode = "dark";
        dark = "Zed (Default)";
        light = "Zed (Default)";
      };
      telemetry = {
        metrics = false;
      };
    };
  };
}
