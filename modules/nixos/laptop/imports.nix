{ config, ... }:
{
  flake.nixosModules.laptop.imports = with config.flake.nixosModules; [
    display
    fprint
    power
    wireless
  ];
}
