{
  flake.nixosModules.desktop-disk-info = {
    services.flatpak.packages = [
      "org.gnome.baobab"
    ];
  };
}
