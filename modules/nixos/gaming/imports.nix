{ config, ... }:
{
  flake.nixosModules.gaming.imports = with config.flake.nixosModules; [
    geforce-now
  ];
}
