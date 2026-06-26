{ config, inputs, ... }:
{
  flake.nixosModules.extra.imports = with config.flake.nixosModules; [
    core
    extra-comma
    extra-firmware
    extra-nh
    extra-nix
    extra-passwords
    extra-security
    extra-ssh
    extra-vpn
    extra-xdg
  ];
}
