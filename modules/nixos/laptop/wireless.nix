{
  flake.nixosModules.wireless = {
    networking.wireless.iwd = {
      enable = true;
    };
    hardware.bluetooth = {
      enable = true;
    };
  };
}
