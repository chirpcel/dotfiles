{
  flake.nixosModules.desktop-terminal = {
    services.flatpak = {
      packages = [
        "app.devsuite.Ptyxis"
      ];
      overrides."app.devsuite.Ptyxis" = {
        Context.devices = [ "all" ];
      };
    };
  };
}
