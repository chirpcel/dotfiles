{ config, inputs, ... }:
{
  flake.nixosModules.core.imports = with config.flake.nixosModules; [
    inputs.disko.nixosModules.disko
    agenix
    boot
    editor
    firmware
    locale
    network
    nh
    nix
    security
    ssh
    stow
  ];
}
