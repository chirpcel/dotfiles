{
  flake.nixosModules.fprint = {
    services.fprintd = {
      enable = true;
    };
  };
}
