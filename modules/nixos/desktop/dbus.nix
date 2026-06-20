{
  flake.nixosModules.dbus = {
    services.dbus = {
      enable = true;
      implementation = "broker";
    };
  };
}
