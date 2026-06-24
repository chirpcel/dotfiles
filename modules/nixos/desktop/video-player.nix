{
  flake.nixosModules.desktop-video-player = {
    services.flatpak.packages = [
      "org.gnome.Showtime"
    ];
  };
}