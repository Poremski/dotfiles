_:

{
  powerManagement.enable = true;

  services = {
    thermald.enable = true;
    fwupd.enable = true;
    fprintd.enable = true;
    hardware.bolt.enable = true;
  };

  hardware.bluetooth.enable = true;
}
