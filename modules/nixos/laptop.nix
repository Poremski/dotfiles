{ ... }:

{
  powerManagement.enable = true;

  services.thermald.enable = true;
  services.fwupd.enable = true;
  services.fprintd.enable = true;
  services.hardware.bolt.enable = true;

  hardware.bluetooth.enable = true;
}
