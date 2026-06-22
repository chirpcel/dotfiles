{
  flake.nixosModules.desktop-splash = {
    boot = {
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "udev.log_level=3"
        "systemd.show_status=auto"
      ];
      plymouth = {
        enable = true;
        theme = "bgrt";
      };
    };
  };
}
