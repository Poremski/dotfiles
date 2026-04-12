{pkgs, ...}: {
  home.packages = [
    pkgs.hunspell
    pkgs.hunspellDicts.en_US-large
    pkgs.hunspellDicts.en_GB-ise
    pkgs.hunspellDicts.sv_SE
    pkgs.hunspellDicts.pl_PL
    pkgs.hunspellDicts.es_ES
    pkgs.libreoffice
  ];
}
