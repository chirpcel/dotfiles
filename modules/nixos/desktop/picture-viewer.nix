{
  flake.nixosModules.desktop-picture-viewer = {
    services.flatpak.packages = [
      "org.gnome.Loupe"
    ];
  };
}