{
  flake.nixosModules.firmware = {
    hardware.enableRedistributableFirmware = true;
    services.fwupd.enable = true;
  };
}
