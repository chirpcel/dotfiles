{
  flake.nixosModules.polkit = {
    security.soteria = {
      enable = true;
    };
  };
}
