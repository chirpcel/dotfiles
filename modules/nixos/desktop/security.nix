{
  flake.nixosModules.desktop-security = {
    services.usbguard.dbus.enable = true;
  };
}
