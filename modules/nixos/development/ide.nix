{
  flake.nixosModules.development-ide = {
    services.flatpak = {
      packages = [
        "org.gnome.Builder"
      ];
    };
  };
}
