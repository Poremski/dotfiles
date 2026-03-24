{ ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices.cryptlvm = {
    device = "/dev/disk/by-uuid/25026abd-9ead-4ae4-9dfa-4550e51d8c39";
    preLVM = true;
  };

  boot.supportedFilesystems = [ "btrfs" ];

  zramSwap.enable = true;
}
