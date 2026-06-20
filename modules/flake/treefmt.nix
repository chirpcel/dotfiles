{ inputs, ... }:

{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];
  perSystem = { config, pkgs, ... }: {
    treefmt = {
      projectRootFile = "flake.nix";
      flakeCheck = true;
      programs = {
        nixfmt.enable = true;
      };
    };
  };
}
