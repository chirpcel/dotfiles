{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  flake.nixosConfigurations.amorph = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ({ pkgs, modulesPath, ... }: {
        imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
      })
      config.flake.nixosModules.core
      ./_config
    ];
  };
}
