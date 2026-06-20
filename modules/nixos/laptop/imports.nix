{ config, ... }:
{
  flake.nixosModules.laptop.imports = with config.flake.nixosModules; [
    wireless
  ];
}
