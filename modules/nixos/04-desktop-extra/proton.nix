{
  flake.nixosModules.desktop-proton = {
    environment.variables.PROTON_PASS_LINUX_KEYRING = "dbus";
  };
}
