{
  flake.nixosModules.development-ide = {
    services.flatpak = {
      packages = [
        "org.gnome.Builder"
      ];
      overrides."org.gnome.Builder".Context = {
        devices = [ "all" ];
      };
    };
  };
}
