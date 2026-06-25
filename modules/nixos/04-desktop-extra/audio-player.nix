{
  flake.nixosModules.desktop-audio-player = {
    services.flatpak.packages = [
      "org.gnome.Decibels"
    ];
  };
}
