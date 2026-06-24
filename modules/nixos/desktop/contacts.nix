{
  flake.nixosModules.desktop-contacts = {
    services.flatpak.packages = [
      "org.gnome.Contacts"
    ];
  };
}