{ config, inputs, ... }:
{
  flake.nixosModules.core.imports = with config.flake.nixosModules; [
    inputs.disko.nixosModules.disko
    core-boot
    core-editor
    core-file-sharing
    core-hardware
    core-keyboard
    core-kmscon
    core-locale
    core-network
    core-shell
    core-stow
  ];
}
