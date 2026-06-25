{
  flake.nixosModules.core-keyboard = {
    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
}
