{
  flake.nixosModules.core-kmscon = {
    services.kmscon = {
      enable = true;
      config.hwaccel = true;
    };
  };
}