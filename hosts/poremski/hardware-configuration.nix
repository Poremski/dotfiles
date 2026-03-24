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

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/52e6c601-d49e-4b9d-bd91-2912427c9d0c";
    fsType = "btrfs";
    options = [
      "subvol=@"
      "compress=zstd:3"
      "ssd"
      "space_cache=v2"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/52e6c601-d49e-4b9d-bd91-2912427c9d0c";
    fsType = "btrfs";
    options = [
      "subvol=@home"
      "compress=zstd:3"
      "ssd"
      "space_cache=v2"
    ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/52e6c601-d49e-4b9d-bd91-2912427c9d0c";
    fsType = "btrfs";
    options = [
      "subvol=@log"
      "compress=zstd:3"
      "ssd"
      "space_cache=v2"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/24DD-5604";
    fsType = "vfat";
  };
}
