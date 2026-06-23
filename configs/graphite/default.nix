{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  flake.nixosConfigurations.graphite = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      config.flake.nixosModules.core
      config.flake.nixosModules.laptop
      config.flake.nixosModules.desktop
      config.flake.nixosModules.impermanence
      config.flake.nixosModules.development
      config.flake.nixosModules.gaming
      ./_config
    ];
  };
}
