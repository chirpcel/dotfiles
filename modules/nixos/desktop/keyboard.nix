{
  flake.nixosModules.desktop-keyboard = {
    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
}
