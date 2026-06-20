{ inputs, ... }:

{
  flake.nixosModules.compositor = {
    programs.niri.enable = true;
    stow.packages = [ "niri" ];
  };
}
