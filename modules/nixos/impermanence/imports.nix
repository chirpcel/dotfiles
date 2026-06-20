{ inputs, config, ... }:
{
  flake.nixosModules.impermanence.imports = [
    inputs.impermanence.nixosModules.impermanence
    config.flake.diskoConfigurations.impermanence
    ./_module
  ];
}
