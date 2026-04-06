{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter
    jetbrains-mono
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts.fontconfig = {
    defaultFonts = {
      sansSerif = ["Inter" "Noto Sans"];
      serif = ["Noto Serif"];
      monospace = ["JetBrains Mono" "Noto Sans Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
