{
  flake.nixosModules.browser = {
    services.flatpak = {
      packages = [
        "com.brave.Browser"
      ];
    };
  };
}
