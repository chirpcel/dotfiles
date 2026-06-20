{
  flake.nixosModules.wireless = {
    networking.wireless = {
      enable = false;
      iwd = {
        enable = true;
        settings = {
          General = {
            AddressRandomization = "network";
          };
          Network = {
            NameResolvingService = "systemd";
          };
        };
      };
    };
    hardware.bluetooth = {
      enable = true;
    };
  };
}
