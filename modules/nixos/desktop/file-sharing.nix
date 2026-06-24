{
  flake.nixosModules.desktop-file-sharing = {
    services.flatpak.packages = [
      "app.drey.Warp"
    ];
  };
}
