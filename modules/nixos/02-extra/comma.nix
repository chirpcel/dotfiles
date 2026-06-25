{ inputs, ... }:
{
  flake.nixosModules.extra-comma = {
    imports = [
      inputs.nix-index-database.nixosModules.default
    ];
    programs.nix-index-database.comma.enable = true;
  };
}
