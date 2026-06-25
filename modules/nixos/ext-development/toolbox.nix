{
  flake.nixosModules.development-toolbox = {
    services.flatpak = {
      packages = [
        "me.iepure.devtoolbox"
      ];
    };
  };
}
