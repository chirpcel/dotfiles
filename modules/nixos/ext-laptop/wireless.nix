{
  flake.nixosModules.wireless =
    { lib, ... }:
    {
      networking = {
        networkmanager.wifi = {
          backend = "iwd";
          powersave = true;
        };
        networkmanager.settings = {
          device = {
            "wifi.iwd.autoconnect" = false;
          };
        };
      };
      hardware.bluetooth = {
        enable = true;
      };
    };
}
