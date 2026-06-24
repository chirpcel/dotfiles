{ config, inputs, ... }:
{
  flake.nixosModules.core.imports = with config.flake.nixosModules; [
    inputs.disko.nixosModules.disko
    core-agenix
    core-boot
    core-comma
    core-editor
    core-file-sharing
    core-firmware
    core-locale
    core-network
    core-nh
    core-nix
    core-passwords
    core-security
    core-shell
    core-ssh
    core-stow
    core-vpn
    core-xdg
  ];
}
