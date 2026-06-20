{ inputs, ... }:
{
  imports = [
    inputs.agenix-rekey.flakeModule
  ];
  perSystem = { config, pkgs, ... }: {
    agenix-rekey.nixosConfigurations = inputs.self.nixosConfigurations;
  };
}
