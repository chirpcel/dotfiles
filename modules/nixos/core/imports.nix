{ config, inputs, ... }:
{
  flake.nixosModules.core.imports = with config.flake.nixosModules; [
    inputs.disko.nixosModules.disko
    agenix
    boot
    comma
    editor
    firmware
    fonts
    locale
    network
    nh
    nix
    security
    shell
    ssh
    stow
  ];
}
