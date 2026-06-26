{
  flake.nixosModules.development-ide = {
    services.flatpak = {
      packages = [
        "org.gnome.Builder"
      ];
      overrides."app.devsuite.Ptyxis".Context = {
        devices = [ "all" ];
      };
    };
    stow.packages = [ "builder" ];
  };
}
