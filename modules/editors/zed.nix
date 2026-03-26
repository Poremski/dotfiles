{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    mutableUserSettings = false;
    mutableUserKeymaps = false;

    extraPackages = with pkgs; [
      nil
      nixd
      package-version-server
      lua-language-server
      ripgrep
      fd
      stylua
    ];

    userSettings = {
      vim_mode = false;
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
      assistant = {
        enable = true;
        provider = "zed.dev";
        model = "codex";
      };
    };
  };
}
