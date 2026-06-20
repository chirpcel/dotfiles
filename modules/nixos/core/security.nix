{
  flake.nixosModules.security = {
    security = {
      rtkit.enable = true;
      sudo.enable = false;
      polkit.enable = true;
      run0.enable = true;
      run0.enableSudoAlias = true;
    };
    services.pcscd = {
      enable = true;
    };
  };
}
