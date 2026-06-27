{
  flake.nixosModules.desktop-imager-writer = {
    services.flatpak.packages = [
      "io.gitlab.adhami3310.Impression"
    ];
  };
}