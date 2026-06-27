{ config, inputs, ... }:
{
  flake.nixosModules.core.imports = with config.flake.nixosModules; [
    inputs.disko.nixosModules.disko
    core-agenix
    core-boot
    core-editor
    core-fonts
    core-hardware
    core-keyboard
    core-kmscon
    core-locale
    core-network
    core-nix
    core-shell
    core-stow
  ];
}
