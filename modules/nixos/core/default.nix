{ config, inputs, ... }:
{
  flake.nixosModules.core.imports = with config.flake.nixosModules; [
    inputs.disko.nixosModules.disko
    core-agenix
    core-boot
    core-comma
    core-editor
    core-firmware
    core-locale
    core-network
    core-nh
    core-nix
    core-proton
    core-security
    core-shell
    core-ssh
    core-stow
  ];
}
