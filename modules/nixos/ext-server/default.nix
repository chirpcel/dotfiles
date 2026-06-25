{ config, ... }:
{
  flake.nixosModules.server = {
    imports = with config.flake.nixosModules; [
      server-ssh
    ];
  };
}
