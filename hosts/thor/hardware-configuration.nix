# Replace this file on thor with output from:
#   sudo nixos-generate-config --show-hardware-config > ~/.nix-config/hosts/thor/hardware-configuration.nix
#
# This placeholder is only here so the flake can evaluate before the real
# Dell XPS 13 9370 hardware configuration has been generated.
{lib, ...}: {
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/REPLACE-ME-ROOT";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/REPLACE-ME-BOOT";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
