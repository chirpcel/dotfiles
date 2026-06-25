{
  flake.nixosModules.core-boot =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        extraModulePackages = [ config.boot.kernelPackages.ddcci-driver ];
        loader = {
          timeout = lib.mkDefault 0;
          efi.canTouchEfiVariables = true;
          systemd-boot = {
            enable = true;
          };
        };
        consoleLogLevel = 3;
        initrd.verbose = false;
        kernelParams = [
          "quiet"
          "udev.log_level=3"
          "systemd.show_status=auto"
        ];
      };
    };
}
