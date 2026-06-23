{
  flake.nixosModules.core-boot =
    { pkgs, config, ... }:
    {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        extraModulePackages = [ config.boot.kernelPackages.ddcci-driver ];
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
