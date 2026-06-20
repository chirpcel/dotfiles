{
  flake.nixosModules.ide = {
    services.flatpak = {
      packages = [
        "dev.zed.Zed"
        "org.freedesktop.Sdk.Extension.rust-stable/x86_64/25.08"
        "org.freedesktop.Sdk.Extension.node24/x86_64/25.08"
      ];
      overrides."dev.zed.Zed" = {
        Environment = {
          ZED_FLATPAK_NO_ESCAPE = "1";
          FLATPAK_ENABLE_SDK_EXT = "rust-stable,node24";
        };
        Context = {
          filesystems = [
            "xdg-config/zed:rw"
          ];
        };
      };
    };
    stow.packages = [ "zed" ];
  };
}
