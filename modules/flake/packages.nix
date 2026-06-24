{ inputs, ... }:
{
  perSystem = { config, pkgs, ... }: {
    packages.amorph = inputs.self.nixosConfigurations.amorph.config.system.build.isoImage;
  };
}