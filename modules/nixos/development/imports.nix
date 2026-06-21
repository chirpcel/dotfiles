{ config, ... }:
{
  flake.nixosModules.development.imports = with config.flake.nixosModules; [
    direnv
    git
    gnupg
    ide
    vibe
  ];
}
