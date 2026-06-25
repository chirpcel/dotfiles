{
  flake.nixosModules.core-kmscon = {
    services.kmscon = {
      enable = true;
      useXkbConfig = true;
    };
  };
}
