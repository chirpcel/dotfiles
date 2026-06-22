{
  flake.nixosModules.desktop-browser = {
    services.flatpak = {
      packages = [
        "com.brave.Browser"
      ];
    };
  };
}
