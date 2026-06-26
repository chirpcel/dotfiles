{
  flake.nixosModules.desktop-browser = {
    services.flatpak = {
      packages = [
        "io.gitlab.librewolf-community"
        "dev.qwery.AddWater"
      ];
    };
  };
}
