{
  flake.nixosModules.desktop-document-viewer = {
    services.flatpak.packages = [
      "org.gnome.Papers"
    ];
  };
}