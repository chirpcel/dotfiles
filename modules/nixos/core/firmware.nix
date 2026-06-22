{
  flake.nixosModules.core-firmware = {
    hardware.enableRedistributableFirmware = true;
    services.fwupd.enable = true;
  };
}
