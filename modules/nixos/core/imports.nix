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
    proton
    security
    shell
    ssh
    stow
  ];
}
