{
  flake.nixosModules.ide = {
    services.flatpak = {
      packages = [
        "dev.zed.Zed"
      ];
      overrides."dev.zed.Zed" = {
        Environment = {
          ZED_FLATPAK_NO_ESCAPE = "1";
        };
      };
    };
  };
}
