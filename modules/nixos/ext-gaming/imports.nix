{ config, ... }:
{
  flake.nixosModules.gaming.imports = with config.flake.nixosModules; [
    gaming-geforce-now
  ];
}
