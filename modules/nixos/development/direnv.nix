{
  flake.nixosModules.development-direnv = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableFishIntegration = true;
    };
  };
}
