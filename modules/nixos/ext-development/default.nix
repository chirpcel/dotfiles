{ config, ... }:
{
  flake.nixosModules.development.imports = with config.flake.nixosModules; [
    development-agent
    development-direnv
    development-gnupg
    development-ide
    development-toolbox
    development-vcs
    development-virtualisation
  ];
}
