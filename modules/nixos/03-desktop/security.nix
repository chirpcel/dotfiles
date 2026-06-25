{
  flake.nixosModules.desktop-security = {
    services.usbguard.dbus.enable = true;
    programs.dconf.profiles.gdm.databases = [
      {
        settings = {
          "org/gnome/login-screen" = {
            enable-fingerprint-authentication = false;
          };
        };
      }
    ];
  };
}
