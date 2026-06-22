{ config, ... }:
{
  flake.nixosModules.development.imports = with config.flake.nixosModules; [
    agent
    direnv
    gnupg
    ide
    vcs
  ];
}
