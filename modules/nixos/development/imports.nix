{ config, ... }:
{
  flake.nixosModules.development.imports = with config.flake.nixosModules; [
    git
    gnupg
    ide
  ];
}
