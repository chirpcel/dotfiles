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
      ({
        environment.etc."nixos".source = inputs.self.outPath;
      })
      config.flake.nixosModules.desktop-extra
      config.flake.nixosModules.development
      config.flake.nixosModules.gaming
      config.flake.nixosModules.impermanence
      config.flake.nixosModules.laptop
      config.flake.nixosModules.udev-keychron-m6-8k
      config.flake.nixosModules.udev-keychron-q1-max
      config.flake.nixosModules.udev-fractal-design-scape
      ./_config
    ];
  };
}
