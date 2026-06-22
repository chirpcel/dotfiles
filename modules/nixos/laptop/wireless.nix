{
  flake.nixosModules.wireless =
    { lib, ... }:
    {
      networking = {
        wireless = {
          enable = lib.mkForce false;
          iwd = {
            enable = true;
          };
        };
        networkmanager.wifi = {
          backend = "iwd";
          powersave = true;
        };
      };
      hardware.bluetooth = {
        enable = true;
      };
    };
}
