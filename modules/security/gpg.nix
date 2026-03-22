{ pkgs, ... }:

{
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableFishIntegration = true;
    pinentry.package = pkgs.pinentry-qt;
    sshKeys = [
      "7A4F2E1CAF436D00CC46DE5B022FACD79B10C33A"
    ];
  };
}
