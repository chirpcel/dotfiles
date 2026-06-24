{
  flake.nixosModules.desktop-calendar = {
    services.flatpak.packages = [
      "org.gnome.Calendar"
    ];
  };
}