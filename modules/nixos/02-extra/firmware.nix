{
  flake.nixosModules.extra-firmware = {
    services.fwupd.enable = true;
  };
}
