{
  flake.nixosModules.core-hardware = {
    hardware.enableRedistributableFirmware = true;
  };
}
