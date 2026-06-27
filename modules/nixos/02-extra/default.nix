{ config, inputs, ... }:
{
  flake.nixosModules.extra.imports = with config.flake.nixosModules; [
    core
    extra-comma
    extra-firmware
    extra-passwords
    extra-sandbox
    extra-security
    extra-ssh
    extra-vpn
  ];
}
