{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  flake.nixosConfigurations.basalt = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      config.flake.diskoConfigurations.default
      config.flake.nixosModules.extra
      config.flake.nixosModules.server
      ./_config
    ];
  };
}
