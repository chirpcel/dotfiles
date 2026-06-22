{
  flake.nixosModules.core-boot =
    { pkgs, ... }:
    {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        loader = {
          timeout = 0;
          efi.canTouchEfiVariables = true;
          systemd-boot = {
            enable = true;
          };
        };
      };
    };
}
