{
  flake.nixosModules.desktop-keyring = {
    services.flatpak.packages = [
      "app.drey.KeyRack"
    ];
  };
}
